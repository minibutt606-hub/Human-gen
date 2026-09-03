import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humanify/backend/server_Controller.dart';

class EmailVerification extends StatefulWidget {
  final String email;
  final String name;
  final String password;

  const EmailVerification({
    super.key,
    required this.email,
    required this.name,
    required this.password,
  });

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final serverController = Get.find<ServerController>();
  final verificationController = TextEditingController();
  bool _isVerifying = false;
  int _resendCountdown = 0;

  @override
  void initState() {
    super.initState();
    _sendVerificationCode();
  }

  Future<void> _sendVerificationCode() async {
    // Send verification code via backend
    await serverController.sendVerificationCode(widget.email);
    setState(() {
      _resendCountdown = 60;
    });
    _startResendCountdown();
  }

  void _startResendCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (_resendCountdown > 0 && mounted) {
        setState(() {
          _resendCountdown--;
        });
        _startResendCountdown();
      }
    });
  }

  Future<void> _verifyCode() async {
    if (verificationController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter the verification code',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    setState(() => _isVerifying = true);

    // Verify code with backend
    bool isVerified = await serverController.verifyCode(
      widget.email,
      verificationController.text,
    );

    if (isVerified) {
      // If code is correct, complete signup
      await serverController.signup(widget.name, widget.email, widget.password);
    }

    setState(() => _isVerifying = false);
  }

  @override
  void dispose() {
    verificationController.dispose();
    super.dispose();
  }

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
              SizedBox(height: 20),
              Image.asset('assets/images/humanify.png', height: 75),
              SizedBox(height: 40),
              Text(
                'Verify Your Email',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'We sent a verification code to ${widget.email}',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),
              // Verification Code Input
              TextField(
                controller: verificationController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 6,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                ),
                decoration: InputDecoration(
                  hintText: '000000',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Colors.grey[300],
                    letterSpacing: 10,
                  ),
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF7AEEB5), width: 2),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Resend Button
              if (_resendCountdown > 0)
                Text(
                  'Resend code in ${_resendCountdown}s',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                )
              else
                GestureDetector(
                  onTap: _sendVerificationCode,
                  child: Text(
                    'Resend Code',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7AEEB5),
                    ),
                  ),
                ),
              SizedBox(height: 40),
              // Verify Button
              GestureDetector(
                onTap: _isVerifying ? null : _verifyCode,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: _isVerifying ? Colors.grey[400] : Color(0xFF7AEEB5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: _isVerifying
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : Text(
                            'Verify',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => Get.back(),
                child: Text(
                  'Go Back',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xFF7AEEB5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
