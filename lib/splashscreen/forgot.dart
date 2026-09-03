// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:humanify/splashscreen/login.dart';

// class Forgot extends StatefulWidget {
//   Forgot({super.key});

//   @override
//   State<Forgot> createState() => _ForgotState();
// }

// class _ForgotState extends State<Forgot> {
//   final TextEditingController _emailController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.arrow_back_ios_new,
//                           size: 18,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     Image.asset('assets/images/humanify.png', height: 75),
//                     SizedBox(width: 45),
//                   ],
//                 ),
//                 SizedBox(height: 40),
//                 Text(
//                   'Forget Your Password ?',
//                   style: GoogleFonts.poppins(
//                     fontSize: 22,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF0F172A),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: Text(
//                     'Enter your email and we will send OTP code to recovery the password',
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.poppins(
//                       fontSize: 14,
//                       color: Colors.grey[500],
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 CustomForgetInputField(
//                   label: 'Email',
//                   hint: 'Johnde12@gmail.com',
//                   controller: _emailController,
//                 ),
//                 SizedBox(height: 140),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     width: double.infinity,
//                     height: 55,
//                     decoration: BoxDecoration(
//                       color: Color(0xFFCE288D),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'Submit',
//                         style: GoogleFonts.poppins(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 25),
//                 GestureDetector(
//                   onTap: () {
//                     Get.to(Login());
//                   },
//                   child: Text(
//                     'Back To Login ?',
//                     style: GoogleFonts.poppins(
//                       color: Color(0xFFD81B8C),
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomForgetInputField extends StatelessWidget {
//   final String label;
//   final String hint;
//   final TextEditingController controller;
//   CustomForgetInputField({
//     super.key,
//     required this.label,
//     required this.hint,
//     required this.controller,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 14),
//         ),
//         SizedBox(height: 8),
//         SizedBox(
//           width: double.infinity,
//           height: 58,
//           child: TextField(
//             controller: controller,
//             style: GoogleFonts.poppins(fontSize: 15),
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: GoogleFonts.poppins(
//                 color: Colors.black54,
//                 fontSize: 14,
//               ),
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 16,
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
//               ),

//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(
//                   color: Color.fromARGB(255, 90, 14, 107),
//                   width: 2,
//                 ),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
