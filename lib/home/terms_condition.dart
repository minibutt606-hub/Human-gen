import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            _buildSection(
              '1. Acceptance of Terms',
              'By downloading and using the Humanify app, you agree to these Terms and Conditions. If you do not agree, please do not use this app.',
            ),

            _buildSection(
              '2. Service Description',
              'Humanify provides AI detection and text analysis services. Our algorithms analyze text to determine the likelihood of AI-generated content.',
            ),

            _buildSection(
              '3. User Responsibilities',
              '• You are responsible for maintaining account security\n• You must not use the app for illegal activities\n• You must not attempt to hack or damage the app\n• You agree not to share offensive or harmful content',
            ),

            _buildSection(
              '4. Limitations of Service',
              '• AI detection is not 100% accurate\n• Results are for informational purposes only\n• We are not liable for decisions made based on our results\n• Service may be temporarily unavailable for maintenance',
            ),

            _buildSection(
              '5. User Content',
              'You retain ownership of content you submit. By submitting content, you grant us the right to analyze and process it for service improvement.',
            ),

            _buildSection(
              '6. Intellectual Property',
              'All app content, including code, design, and algorithms, are the intellectual property of Humanify. You may not reproduce or distribute without permission.',
            ),

            _buildSection(
              '7. Limitation of Liability',
              'Humanify is provided "as is" without warranties. We are not liable for any indirect, incidental, or consequential damages arising from your use of the app.',
            ),

            _buildSection(
              '8. Termination',
              'We reserve the right to terminate accounts that violate these terms. You can delete your account at any time through app settings.',
            ),

            _buildSection(
              '9. Changes to Terms',
              'We may update these terms from time to time. Continued use of the app constitutes acceptance of updated terms.',
            ),

            _buildSection(
              '10. Contact Information',
              'For questions about these terms, please contact us at:\nEmail: support@humanify.com\nPhone: +92 327 1300046',
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.grey[700],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
