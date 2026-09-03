import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humanify/backend/server_Controller.dart';
import 'package:humanify/home/Aichecker.dart';
import 'package:humanify/home/humanize.dart';
import 'package:humanify/home/premium.dart';
import 'package:humanify/home/setting.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final ServerController serverController = Get.find<ServerController>();
  final TextEditingController _textController = TextEditingController();
  int _charCount = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _textController.addListener(() {
      setState(() {
        _charCount = _textController.text.length;
      });
    });

    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    )..repeat();

    // Screen load hote hi Upgrade Dialog dikhane ke liye
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showUpgradeDialog();
    });
  }

  void _showUpgradeDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1. Robot Image aur Text (ROW mein)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Robot Image
                    Image.asset(
                      'assets/images/rebort.png',
                      height: 120,
                      width: 120,
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Oh Let's Save your Time by upgrading",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            maxLines: 3,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Save your time to check docs by Ai for \$4.99/ weekly",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25),

                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.to(() => Premium());
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFCE288D),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Let's Upgrade",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Section
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(Setting()),
                      child: Icon(Icons.settings_outlined, size: 28),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Humanify ',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFCE288D),
                            ),
                          ),
                          TextSpan(
                            text: 'AI',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(Premium()),
                      child: Icon(Icons.diamond_outlined, size: 28),
                    ),
                  ],
                ),
                SizedBox(height: 25),

                // Main Premium Banner
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFCE288D),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Premium',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Unlock unlimited Ai Detection',
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 12),
                          GestureDetector(
                            onTap: () => Get.to(Premium()),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Upgrade',
                                style: TextStyle(
                                  color: Color(0xFFCE288D),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset('assets/images/bot.png', height: 92),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                // Text Input Box
                Container(
                  width: double.infinity,
                  height: 220,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          maxLines: null,
                          maxLength: 300,
                          decoration: InputDecoration(
                            hintText: 'Paste or type text here...',
                            counterText: '',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: _textController.text),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Text copied to clipboard'),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.copy_outlined,
                              color: Colors.grey,
                              size: 22,
                            ),
                          ),
                          Text(
                            '$_charCount/300',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 18),

                // AI Check Button
                Obx(
                  () => GestureDetector(
                    onTap: () async {
                      String text = _textController.text.trim();
                      if (text.isEmpty) {
                        Get.snackbar(
                          'Info',
                          'Please enter text',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }
                      if (serverController.isLoading.value) return;
                      double score = await serverController.detectText(text);
                      if (score >= 0) Get.to(() => Aichecker(score: score));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Color(0xFFCE288D),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: serverController.isLoading.value
                          ? Center(child: _buildLoadingIndicator())
                          : Center(
                              child: Text(
                                'Let\'s Check AI',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // More Features
                Row(
                  children: [
                    Text(
                      'More Features ',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.diamond_outlined, size: 20, color: Colors.black),
                  ],
                ),
                SizedBox(height: 15),

                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.90,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    _featureCardWrapper(
                      isLoading: serverController.isHumanizing,
                      icon: Icons.person_outline,
                      title: 'Humanize AI\nGenerated Text',
                      subtitle: 'Humanize your ai text',
                      btnText: 'Generate',
                      onTap: () async {
                        String text = _textController.text.trim();
                        if (text.isEmpty) return;
                        String result = await serverController.humanizeText(
                          text,
                        );
                        if (result.isNotEmpty)
                          Get.to(() => Humanize(humanizedText: result));
                      },
                    ),
                    _featureCardWrapper(
                      isLoading: serverController.isDetecting,
                      icon: Icons.picture_as_pdf_outlined,
                      title: 'Check PDF Text\nFor AI',
                      subtitle: 'Check your pdf text for AI',
                      btnText: 'Upload',
                      onTap: () async {
                        String text = _textController.text.trim();
                        if (text.isEmpty) return;
                        double score = await serverController.detectPDFText(
                          text,
                        );
                        if (score >= 0) Get.to(() => Aichecker(score: score));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Refactored Helper for Feature Cards with Obx
  Widget _featureCardWrapper({
    required RxBool isLoading,
    required IconData icon,
    required String title,
    required String subtitle,
    required String btnText,
    required VoidCallback onTap,
  }) {
    return Obx(
      () => GestureDetector(
        onTap: isLoading.value ? null : onTap,
        child: _buildFeatureCard(
          icon: icon,
          title: title,
          subtitle: subtitle,
          btnText: btnText,
          isLoading: isLoading.value,
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String btnText,
    bool isLoading = false,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 30, color: Color(0xFFCE288D)),
              SizedBox(height: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 35,
            decoration: BoxDecoration(
              color: Color(0xFFCE288D),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: isLoading
                  ? _buildLoadingIndicator(small: true)
                  : Text(
                      btnText,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator({bool small = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/bot.png', height: small ? 15 : 25),
        SizedBox(width: 8),
        _buildAnimatedDot(0),
        SizedBox(width: 4),
        _buildAnimatedDot(1),
        SizedBox(width: 4),
        _buildAnimatedDot(2),
      ],
    );
  }

  Widget _buildAnimatedDot(int index) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double progress = _animationController.value;
        double delay = index * 0.15;
        double animValue = ((progress + delay) % 1.0);
        double offset = (animValue < 0.5)
            ? (animValue * 2) * 5
            : ((1 - animValue) * 2) * 5;
        return Transform.translate(
          offset: Offset(0, -offset),
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
