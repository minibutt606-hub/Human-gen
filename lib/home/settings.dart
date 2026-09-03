import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanify/backend/server_Controller.dart';
import 'package:humanify/home/contact_us.dart';
import 'package:humanify/home/privacy_policy.dart';
import 'package:humanify/home/rate_app.dart';
import 'package:humanify/home/share_app.dart';
import 'package:humanify/home/terms_condition.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final ServerController _controller = Get.find<ServerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              
              // Contact Us
              _buildSettingItem(
                icon: Icons.person_outline,
                title: 'Contact Us',
                onTap: () {
                  print('Contact Us tapped');
                  Get.to(() => ContactUs());
                },
                showArrow: false,
              ),
              SizedBox(height: 12),
              
              // Privacy Policy
              _buildSettingItem(
                icon: Icons.shield_outlined,
                title: 'Privacy Policy',
                onTap: () {
                  print('Privacy Policy tapped');
                  Get.to(() => PrivacyPolicy());
                },
                showArrow: true,
              ),
              SizedBox(height: 12),
              
              // Rate
              _buildSettingItem(
                icon: Icons.star_outline,
                title: 'Rate',
                onTap: () {
                  print('Rate tapped');
                  Get.to(() => RateApp());
                },
                showArrow: false,
              ),
              SizedBox(height: 12),
              
              // Share App
              _buildSettingItem(
                icon: Icons.share_outlined,
                title: 'Share this app',
                onTap: () {
                  print('Share tapped');
                  Get.to(() => ShareApp());
                },
                showArrow: true,
              ),
              SizedBox(height: 12),
              
              // Terms & Condition
              _buildSettingItem(
                icon: Icons.check_circle_outline,
                title: 'Terms & Condition',
                onTap: () {
                  print('Terms tapped');
                  Get.to(() => TermsCondition());
                },
                showArrow: false,
              ),
              SizedBox(height: 24),
              
              // Logout Button
              _buildLogoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool showArrow,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.black54),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            if (showArrow)
              Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFCE288D)),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return GestureDetector(
      onTap: () async {
        print('Logout tapped');
        await _controller.signout();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red.shade200, width: 1.5),
        ),
        child: Row(
          children: [
            Icon(Icons.logout_rounded, size: 24, color: Colors.red),
            SizedBox(width: 16),
            Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
