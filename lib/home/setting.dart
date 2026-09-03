import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanify/backend/server_Controller.dart';
import 'package:humanify/home/contact_us.dart';
import 'package:humanify/home/privacy_policy.dart';
import 'package:humanify/home/rate_app.dart';
import 'package:humanify/home/share_app.dart';
import 'package:humanify/home/terms_condition.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
          child: Column(
            children: [
              SizedBox(height: 8),
              _buildItem(Icons.person_outline, 'Contact Us', () => Get.to(() => ContactUs()), false),
              SizedBox(height: 10),
              _buildItem(Icons.shield_outlined, 'Privacy Policy', () => Get.to(() => PrivacyPolicy()), true),
              SizedBox(height: 10),
              _buildItem(Icons.star_outline, 'Rate', () => Get.to(() => RateApp()), false),
              SizedBox(height: 10),
              _buildItem(Icons.share_outlined, 'Share this app', () => Get.to(() => ShareApp()), true),
              SizedBox(height: 10),
              _buildItem(Icons.check_circle_outline, 'Terms & Condition', () => Get.to(() => TermsCondition()), false),
              SizedBox(height: 18),
              _buildLogout(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(IconData icon, String title, VoidCallback onTap, bool showArrow) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: Colors.grey.shade200, width: 0.7),
        ),
        child: Row(
          children: [
            Icon(icon, size: 21, color: Colors.black54),
            SizedBox(width: 13),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ),
            if (showArrow)
              Icon(Icons.arrow_forward_ios, size: 13, color: Color(0xFFCE288D)),
          ],
        ),
      ),
    );
  }

  Widget _buildLogout() {
    return GestureDetector(
      onTap: () async => await _controller.signout(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: Colors.red.shade200, width: 0.8),
        ),
        child: Row(
          children: [
            Icon(Icons.logout_rounded, size: 21, color: Colors.red),
            SizedBox(width: 13),
            Text(
              'Logout',
              style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w600, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
