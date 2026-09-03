import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:get/get.dart';
import 'package:humanify/home/home.dart';
import 'package:humanify/splashscreen/login.dart';
import 'package:humanify/splashscreen/signup.dart';
import 'package:humanify/backend/email_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class ServerController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isselected = false.obs;
  RxBool remmeberme = false.obs;
  Timer? _timer;
  RxBool isHumanizing = false.obs;
  RxBool isDetecting = false.obs;
  RxBool isSummarizing = false.obs;

  // Email verification
  Map<String, String> _verificationCodes = {}; // email -> code mapping

  String base_url = 'https://humanify.tecclubb.com/api/';
  final String rephrasyAuthToken = "w4FMm7Wx6x0PZFX";
  // ZeroGPT Detect API Key
  String zeroGptApiKey = "73a7a368-4f5c-4f70-a681-75b1349d9ec9";

  Future sendVerificationCode(String email) async {
    try {
      // Generate a random 6-digit code
      String verificationCode = (100000 + Random().nextInt(900000)).toString();
      _verificationCodes[email] = verificationCode;

      print("Verification Code for $email: $verificationCode");

      // Call email service (test mode just prints to console)
      await EmailService.sendVerificationCode(
        recipientEmail: email,
        code: verificationCode,
      );

      // Show code in console message
      Get.snackbar(
        "Code (Check Console)",
        "Verification code: $verificationCode",
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    } catch (e) {
      print("Send verification error: $e");
      Get.snackbar(
        "Error",
        "Failed to send verification code: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<bool> verifyCode(String email, String code) async {
    try {
      // Locally check if code is correct
      String? savedCode = _verificationCodes[email];

      print("Checking code: entered=$code, saved=$savedCode");

      if (savedCode == null || savedCode != code) {
        Get.snackbar(
          "Error",
          "Incorrect verification code",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }

      // Code is correct!
      Get.snackbar(
        "Success",
        "Email verified successfully",
        backgroundColor: Color(0xFF7AEEB5),
        colorText: Colors.white,
      );

      print("✅ Code verified successfully for $email");
      return true;
    } catch (e) {
      print("Verify code error: $e");
      Get.snackbar(
        "Error",
        "Verification error: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }

  Future signup(String name, String email, String pass) async {
    try {
      isLoading.value = true;
      var response = await post(
        Uri.parse(base_url + "signup"),
        headers: {"Content-type": "application/json"},
        body: jsonEncode({
          "name": name.trim(),
          "email": email.trim(),
          "password": pass.trim(),
        }),
      );
      var data = jsonDecode(response.body);
      print("API RESPONSE: $data");
      if (response.statusCode == 200 || response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        String? myToken =
            data['token'] ??
            data['access_token'] ??
            (data['data'] != null ? data['data']['token'] : null);

        if (myToken != null) {
          await prefs.setString('token', myToken);
          print("TOKEN SAVED: $myToken");
        }
        Get.snackbar(
          "Congratulations",
          "Your account has been Created",
          backgroundColor: const Color.fromARGB(255, 232, 133, 103),
          colorText: Colors.white,
        );
        Get.offAll(() => Home());
      } else {
        var errordata = jsonDecode(response.body);
        String msg = "Signup Failed";
        if (errordata["message"] != null) {
          if (errordata["message"] is List) {
            msg = (errordata["message"] as List).join(", ");
          } else {
            msg = errordata["message"].toString();
          }
        }
        Get.snackbar(
          "Error",
          msg,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Signup error: $e");
      Get.snackbar(
        "Error",
        "Signup failed: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<double> detectText(String text, {String mode = ""}) async {
    try {
      isLoading.value = true;

      var url = Uri.parse("https://api.zerogpt.com/api/detect/detectText");

      var response = await post(
        url,
        headers: {"Content-Type": "application/json", "ApiKey": zeroGptApiKey},
        body: jsonEncode({"input_text": text.trim()}),
      );

      print("DETECT STATUS: ${response.statusCode}");
      print("DETECT BODY: ${response.body}");
      print("DETECT HEADERS: ${response.headers}");

      double score = 0.0;

      // Check if response body is empty or null
      if (response.body.isEmpty) {
        Get.snackbar(
          "Info",
          "API call successful but no response data",
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        return 50.0; // Return middle score if no data
      }

      var data = jsonDecode(response.body);
      print("DETECT RESPONSE: $data");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Try different response formats
        if (data['data'] != null) {
          var detectionData = data['data'];
          if (detectionData is Map) {
            if (detectionData['fakePercentage'] != null) {
              score = (detectionData['fakePercentage'] as num).toDouble();
            } else if (detectionData['score'] != null) {
              score = (detectionData['score'] as num).toDouble();
            } else if (detectionData['is_human'] != null) {
              score = (detectionData['is_human'] as bool) ? 0.0 : 100.0;
            }
          }
        } else if (data['fakePercentage'] != null) {
          score = (data['fakePercentage'] as num).toDouble();
        } else if (data['score'] != null) {
          score = (data['score'] as num).toDouble();
        } else if (data['is_human'] != null) {
          score = (data['is_human'] as bool) ? 0.0 : 100.0;
        } else if (data['fake'] != null) {
          score = (data['fake'] as num).toDouble();
        }

        // If API returns 0-1 scale, convert to percentage
        if (score > 0 && score <= 1.0) score = score * 100;

        // Clamp to 0..100
        score = score.clamp(0.0, 100.0);

        Get.snackbar(
          "Success",
          "AI Detection: ${score.toStringAsFixed(1)}% AI",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        return score;
      } else {
        // Parse error message
        String msg = "Detection failed with status ${response.statusCode}";
        if (data is Map) {
          if (data['message'] != null)
            msg = data['message'].toString();
          else if (data['error'] != null)
            msg = data['error'].toString();
        }
        Get.snackbar(
          "Error",
          msg,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

        return -1.0; // indicate failure
      }
    } catch (e) {
      print("Detect Error: $e");
      Get.snackbar(
        "Error",
        "Detection failed: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return -1.0;
    } finally {
      isLoading.value = false;
    }
  }

  // Detect AI in PDF text (same as detectText)
  Future<double> detectPDFText(String text) async {
    return await detectText(text);
  }

  // Humanize AI Generated Text
  Future<String> humanizeText(String text) async {
    try {
      isHumanizing.value = true;

      // Debugging ke liye: API call se pehle check karein
      print(
        "Sending text to API: ${text.substring(0, min(10, text.length))}...",
      );

      var response = await post(
        Uri.parse("https://v2-humanizer.rephrasy.ai/api"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $rephrasyAuthToken",
        },
        body: jsonEncode({
          "text": text.trim(),
          "model":
              "premium", // 'default' ki jagah 'premium' ya 'quality' try karein agar API support karti hai
          "style": "formal",
        }),
      );

      print("HUMANIZE STATUS: ${response.statusCode}");
      print("HUMANIZE BODY: ${response.body}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // Rephrasy API different keys use karti hai, hum sab check kar letay hain
        String result =
            data['humanized_text'] ??
            data['text'] ??
            data['output'] ??
            data['result'] ??
            "";

        if (result.isNotEmpty) {
          return result;
        } else {
          Get.snackbar(
            "API Info",
            "AI generated an empty response. Try different text.",
            backgroundColor: Colors.orange,
          );
          return "";
        }
      } else {
        Get.snackbar(
          "Error",
          "Server Error: ${response.statusCode}",
          backgroundColor: Colors.red,
        );
        return "";
      }
    } catch (e) {
      print("Humanize Catch Error: $e");
      return "";
    } finally {
      isHumanizing.value = false;
    }
  }

  Future signout() async {
    try {
      isLoading.value = true;

      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.remove("token");
      await preferences.remove("rephrasyApiKey");

      _timer?.cancel();

      Get.snackbar(
        "Logout",
        "You have been logged out successfully",
        backgroundColor: Color(0xFF7AEEB5),
        colorText: Colors.white,
      );

      Get.offAll(() => Signup());
    } catch (e) {
      Get.snackbar(
        "Error",
        "Logout failed: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
