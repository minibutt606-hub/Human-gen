import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class RateApp extends StatefulWidget {
  const RateApp({super.key});

  @override
  State<RateApp> createState() => _RateAppState();
}

class _RateAppState extends State<RateApp> {
  int _rating = 0;
  bool _isLoading = false;

  Future<void> _submitRating() async {
    if (_rating == 0) {
      Get.snackbar(
        'Please Rate',
        'Please select a rating first',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await http.post(
        Uri.parse('https://dev-api.edgevera.site/v1/feedback/stores'),
        headers: {'Content-Type': 'application/json'},
        body: '{"rating":$_rating,"feedback":"Humanify App Rating"}',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          'Thank You!',
          'Thank you for rating us $_rating stars!',
          backgroundColor: Colors.pink,
          colorText: Colors.white,
        );
        Future.delayed(Duration(seconds: 1), () => Get.back());
      } else {
        Get.snackbar(
          'Error',
          'Failed to submit rating',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Humanify'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Icon(Icons.star_outline, size: 80, color: Color(0xFFCE288D)),
              SizedBox(height: 24),
              Text(
                'Love Humanify?',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Please rate us on the app store. Your feedback helps us improve!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => setState(() => _rating = index + 1),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Icon(
                          index < _rating ? Icons.star : Icons.star_outline,
                          size: 45,
                          color: Color(0xFFCE288D),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 12),
              if (_rating > 0)
                Text(
                  'You rated: $_rating star${_rating > 1 ? 's' : ''}',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFCE288D),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GestureDetector(
                  onTap: _isLoading ? null : _submitRating,
                  child: Center(
                    child: _isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            'Submit Rating',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Center(
                    child: Text(
                      'Maybe Later',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
