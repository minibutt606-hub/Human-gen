import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humanify/backend/server_Controller.dart';
import 'package:humanify/home/home.dart';
import 'package:humanify/splashscreen/login.dart';
import 'package:humanify/splashscreen/email_verification.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final serverController = Get.put(ServerController());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Image.asset('assets/images/humanify.png', height: 75),
                  SizedBox(width: 48),
                ],
              ),
              SizedBox(height: 25),
              Text(
                'Welcome to Humanify AI',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'please create an account with your email address.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF1A1A1A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 2,
                          color: const Color(0xFFD81B8C),
                        ), // Pink line
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),
              _buildInputField(
                controller: nameController,
                label: 'Username',
                hint: 'Johnde12@',
                onChanged: (val) => serverController.isselected(
                  nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passController.text.isNotEmpty,
                ),
              ),
              SizedBox(height: 20),
              _buildInputField(
                controller: emailController,
                label: 'Email',
                hint: 'John.doe@gmail.com',
                onChanged: (val) => serverController.isselected(
                  nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passController.text.isNotEmpty,
                ),
              ),
              SizedBox(height: 20),
              _buildInputField(
                controller: passController,
                label: 'Password',
                hint: '*********',
                isPassword: true,
                onChanged: (val) => serverController.isselected(
                  nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passController.text.isNotEmpty,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () => setState(() {
                    _isObscured = !_isObscured;
                  }),
                ),
              ),

              SizedBox(height: 15),
              Row(
                children: [
                  Obx(() {
                    return GestureDetector(
                      onTap: () {
                        serverController.remmeberme.value =
                            !serverController.remmeberme.value;
                      },
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: serverController.remmeberme.value
                              ? Colors.pink
                              : Colors.transparent,
                          border: Border.all(
                            color: serverController.remmeberme.value
                                ? Colors.pink
                                : Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: serverController.remmeberme.value
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 10,
                                fontWeight: FontWeight.bold,
                              )
                            : null,
                      ),
                    );
                  }),
                  SizedBox(width: 10),
                  Text(
                    'Password must be at least 8 character, uppercase, \nlowercase, and unique code like #%!',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    if (serverController.isselected.value &&
                        !serverController.isLoading.value) {
                      // Show loading immediately
                      serverController.isLoading.value = true;
                      
                      // Then go to verification screen
                      Future.delayed(Duration(milliseconds: 300), () {
                        serverController.isLoading.value = false;
                        Get.to(() => EmailVerification(
                          email: emailController.text,
                          name: nameController.text,
                          password: passController.text,
                        ));
                      });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: serverController.isselected.value
                          ? Color(0xFFCE288D)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: serverController.isLoading.value
                        ? Center(
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    Function(String)? onChanged,
    bool isPassword = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: isPassword ? _isObscured : false,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
      ],
    );
  }
}
