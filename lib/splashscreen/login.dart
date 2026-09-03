// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:humanify/home/home.dart';
// import 'package:humanify/splashscreen/forgot.dart';
// import 'package:humanify/splashscreen/signup.dart';

// class Login extends StatefulWidget {
//   Login({super.key});
//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   bool _isObscured = true;
//   bool _rememberMe = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: Container(
//                       width: 40,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[100],
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.arrow_back_ios_new,
//                         size: 20,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   Image.asset('assets/images/humanify.png', height: 75),
//                   SizedBox(width: 48),
//                 ],
//               ),
//               SizedBox(height: 25),
//               Text(
//                 'Welcome to Humanify AI',
//                 style: GoogleFonts.poppins(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF0F172A),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Please enter your email & password to\n log in.',
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
//               ),
//               SizedBox(height: 40),
//               // ... (Aapka baaki code same rahega)

//               // --- TABS SECTION START ---
//               Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       children: [
//                         Text(
//                           'Login',
//                           style: GoogleFonts.poppins(
//                             color: const Color(0xFF1A1A1A), // Active color
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Container(
//                           height: 2,
//                           color: const Color(0xFFD81B8C),
//                         ), // Pink line
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         Get.off(
//                           () => Signup(),
//                           transition: Transition.noTransition,
//                         );
//                       },
//                       child: Column(
//                         children: [
//                           Text(
//                             'Sign Up',
//                             style: GoogleFonts.poppins(
//                               color: Colors.grey, // Inactive color
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Container(
//                             height: 2,
//                             color: Colors.grey[200],
//                           ), // Light line
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // --- TABS SECTION END ---

//               // ... (Baaki Login ke fields)
//               SizedBox(height: 40),
//               CustomLoginField(label: 'Email', hint: 'John.doe@gmail.com'),
//               SizedBox(height: 20),
//               CustomLoginField(
//                 label: 'Password',
//                 hint: '*********',
//                 isPassword: true,
//                 isObscured: _isObscured,
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     _isObscured
//                         ? Icons.visibility_off_outlined
//                         : Icons.visibility_outlined,
//                     color: Colors.grey,
//                   ),
//                   onPressed: () => setState(() => _isObscured = !_isObscured),
//                 ),
//               ),
//               SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       SizedBox(
//                         height: 24,
//                         width: 24,
//                         child: Checkbox(
//                           value: _rememberMe,
//                           activeColor: Color(0xFFD81B8C),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           onChanged: (value) =>
//                               setState(() => _rememberMe = value!),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         'Remember me',
//                         style: GoogleFonts.poppins(
//                           color: Colors.blueGrey,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ],
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Get.to(Forgot());
//                     },
//                     child: Text(
//                       'Forgot password?',
//                       style: GoogleFonts.poppins(
//                         color: Color(0xFFD81B8C),
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 100),
//               GestureDetector(
//                 onTap: () {
//                   Get.to(Home());
//                 },
//                 child: Container(
//                   width: double.infinity,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Color(0xFFCE288D),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Login',
//                       style: GoogleFonts.poppins(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Haven't account yet? ",
//                     style: GoogleFonts.poppins(color: Colors.grey),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Get.to(Signup());
//                     },
//                     child: Text(
//                       'Sign Up',
//                       style: GoogleFonts.poppins(
//                         color: Color(0xFFD81B8C),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTab(String text, bool isActive) {
//     return Column(
//       children: [
//         Text(
//           text,
//           style: GoogleFonts.poppins(
//             color: isActive ? Color(0xFFD81B8C) : Colors.grey,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(height: 10),
//         Container(
//           height: 2,
//           color: isActive ? Color(0xFFD81B8C) : Colors.grey[200],
//         ),
//       ],
//     );
//   }
// }

// class CustomLoginField extends StatelessWidget {
//   final String label;
//   final String hint;
//   final bool isPassword;
//   final bool isObscured;
//   final Widget? suffixIcon;

//   CustomLoginField({
//     super.key,
//     required this.label,
//     required this.hint,
//     this.isPassword = false,
//     this.isObscured = false,
//     this.suffixIcon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
//         ),
//         SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: TextField(
//             obscureText: isPassword ? isObscured : false,
//             style: GoogleFonts.poppins(fontSize: 15),
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: GoogleFonts.poppins(fontSize: 14),
//               suffixIcon: suffixIcon,

//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 16,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: Colors.grey.shade300),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: Colors.grey.shade300),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
