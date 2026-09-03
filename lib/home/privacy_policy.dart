import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
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
              'Introduction',
              'At Humanify, we value your privacy and are committed to protecting your personal data. This Privacy Policy explains how we collect, use, and protect your information.',
            ),

            _buildSection(
              'Information We Collect',
              '• Account information (name, email, password)\n• Text content you upload for AI detection\n• Usage analytics and preferences\n• Device information for app optimization',
            ),

            _buildSection(
              'How We Use Your Data',
              '• To provide AI detection and text analysis services\n• To improve our app features and performance\n• To communicate with you about updates\n• To ensure security and prevent abuse',
            ),

            _buildSection(
              'Data Security',
              'We implement industry-standard security measures to protect your data. Your information is encrypted and stored securely on our servers.',
            ),

            _buildSection(
              'Third-Party Services',
              'We use third-party APIs for AI detection services. These providers have their own privacy policies and data handling practices.',
            ),

            _buildSection(
              'Your Rights',
              '• You can request to access your data\n• You can request deletion of your account\n• You can opt-out of analytics\n• You have the right to data portability',
            ),

            _buildSection(
              'Changes to This Policy',
              'We may update this Privacy Policy from time to time. We will notify you of any significant changes through the app.',
            ),

            _buildSection(
              'Contact Us',
              'If you have questions about our Privacy Policy, please contact us at:\nEmail: support@humanify.com\nPhone: +92 327 1300046',
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
