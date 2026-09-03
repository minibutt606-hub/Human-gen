import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:humanify/home/premium.dart';

class Humanize extends StatefulWidget {
  // Yahan Constructor fix kar diya hai taake data sahi receive ho
  final String humanizedText;

  Humanize({
    super.key,
    required this.humanizedText, // Isay required kar diya
  });

  @override
  State<Humanize> createState() => _HumanizeState();
}

class _HumanizeState extends State<Humanize> {
  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    Get.snackbar(
      'Success',
      'Text copied to clipboard!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Ab ye direct wahi text uthaye ga jo API se aya hai
    String cardContent = widget.humanizedText;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Humanize AI',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.to(Premium()),
            icon: Icon(Icons.diamond_outlined, color: Colors.black, size: 28),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFCE288D),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Asli Humanized Text yahan dikhe ga
                  Text(
                    cardContent,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.white24),
                  SizedBox(height: 10),

                  // Copy Button
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () => _copyToClipboard(cardContent),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.copy_all_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text("Copy", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
