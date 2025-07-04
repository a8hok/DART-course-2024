// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'create_account.dart'; // Import the create account page
// import 'forgot_password.dart'; // Import the forgot password page
// import 'get_started.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Top curve positioned outside the child
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: SizedBox(
//               height: 150, // Adjust height as needed
//               child: SvgPicture.asset(
//                 'assets/images/top-curve.svg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           // Main content container
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(40, 100, 40, 0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Welcome!',
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.lato(
//                       fontSize: 50,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     'Sign in to your account',
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.lato(
//                       fontSize: 18,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   _buildTextField('Username', Icons.person),
//                   const SizedBox(height: 20),
//                   _buildTextField('Password', Icons.lock, obscureText: true),
//                   const SizedBox(height: 30), // Added more spacing

//                   // Forgot Password (Clickable)
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: GestureDetector(
//                       onTap: () {
//                         // Navigate to Forgot Password Page
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const ForgotPasswordPage()),
//                         );
//                       },
//                       child: Text(
//                         'Forgot your password?',
//                         style: GoogleFonts.lato(
//                           fontSize: 15,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 80),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ShaderMask(
//                         shaderCallback: (bounds) => const LinearGradient(
//                           colors: [
//                             Color(0xFF3929C7),
//                             Color(0xFFFA457E),
//                             Color(0xFF7B49FF),
//                           ],
//                         ).createShader(bounds),
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontFamily: 'Lato',
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const GetStartedPage()),
//                           );
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             gradient: const LinearGradient(
//                               colors: [
//                                 Color(0xFFF977D6),
//                                 Color(0xFF623AA2),
//                               ],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           child: const Icon(
//                             Icons.arrow_forward,
//                             color: Colors.white,
//                             size: 22,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 60),

//                   // Create Account (Clickable)
//                   GestureDetector(
//                     onTap: () {
//                       // Navigate to Create Account Page
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const CreateAccountPage()),
//                       );
//                     },
//                     child: Text.rich(
//                       TextSpan(
//                         text: "Don't have an account? ",
//                         style: GoogleFonts.lato(
//                           fontSize: 15,
//                           color: Colors.black, // Black color for the main text
//                         ),
//                         children: [
//                           TextSpan(
//                             text: "Create",
//                             style: GoogleFonts.lato(
//                               fontSize: 15,
//                               color: Colors.blue, // Blue only for "Create"
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   const SizedBox(
//                       height:
//                           30), // Ensure some spacing before the bottom curve
//                 ],
//               ),
//             ),
//           ),

//           // Bottom curve now positioned at the last element
//           Positioned(
//             bottom: 0,
//             left: -312,
//             right: 0,
//             child: SizedBox(
//               height: 300, // Adjust height as needed
//               child: SvgPicture.asset(
//                 'assets/images/bottom-curve.svg',
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField(String hint, IconData icon,
//       {bool obscureText = false}) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF686868).withOpacity(0.1), // Shadow color
//             spreadRadius: 1,
//             blurRadius: 6,
//             offset: const Offset(0, 3), // Shadow position
//           ),
//         ],
//       ),
//       child: TextField(
//         obscureText: obscureText,
//         style: const TextStyle(color: Colors.black),
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: Colors.white,
//           prefixIcon: Icon(icon, color: Colors.black),
//           hintText: hint,
//           hintStyle: const TextStyle(color: Colors.black87),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide: BorderSide.none, // Remove solid border
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide: BorderSide.none,
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'create_account.dart';
import 'forgot_password.dart';
import 'get_started.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hasValidationError = false;
  bool _hasShownToast = false;
  bool _isLoading = false;

  void _showToast(String message) {
    if (_hasShownToast) return;
    _hasShownToast = true;

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 70,
        right: 20,
        child: SlideToast(message: message),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 2), () => overlayEntry.remove());
  }

  // void _handleSignIn() async {
  //   _hasShownToast = false;
  //   _hasValidationError = false;

  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: _usernameController.text.trim(),
  //         password: _passwordController.text.trim(),
  //       );
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const GetStartedPage()),
  //       );
  //     } catch (e) {
  //       _showToast("Authentication failed. Please try again.");
  //     }
  //   }
  // }

  void _handleSignIn() async {
    _hasShownToast = false;
    _hasValidationError = false;

    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(color: Colors.deepPurple),
        ),
      );

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _usernameController.text.trim(),
          password: _passwordController.text.trim(),
        );

        Navigator.of(context).pop(); // Close loader
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const GetStartedPage()),
        );
      } catch (e) {
        Navigator.of(context).pop(); // Close loader
        _showToast("Authentication failed. Please try again.");
      }
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF686868).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(icon, color: Colors.black),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black87),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top curve
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 150,
              child: SvgPicture.asset(
                'assets/images/top-curve.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'Welcome!',
                        style: GoogleFonts.lato(
                          fontSize: 50,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Sign in to your account',
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 40),
                      _buildTextField(
                        controller: _usernameController,
                        hint: 'Email',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            _showToast('Please enter your email');
                            _hasValidationError = true;
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                              .hasMatch(value)) {
                            _showToast('Invalid email format');
                            _hasValidationError = true;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _passwordController,
                        hint: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            _showToast('Please enter your password');
                            _hasValidationError = true;
                          } else if (value.length < 6) {
                            _showToast(
                                'Password must be at least 6 characters');
                            _hasValidationError = true;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot your password?',
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) =>
                                const LinearGradient(colors: [
                              Color(0xFF3929C7),
                              Color(0xFFFA457E),
                              Color(0xFF7B49FF),
                            ]).createShader(bounds),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: _handleSignIn,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFF977D6),
                                    Color(0xFF623AA2),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CreateAccountPage(),
                            ),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Create",
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Bottom curve
          Positioned(
            bottom: 0,
            left: -312,
            right: 0,
            child: SizedBox(
              height: 300,
              child: SvgPicture.asset(
                'assets/images/bottom-curve.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// SlideToast Widget
class SlideToast extends StatefulWidget {
  final String message;
  const SlideToast({super.key, required this.message});

  @override
  State<SlideToast> createState() => _SlideToastState();
}

class _SlideToastState extends State<SlideToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(top: 90),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          decoration: BoxDecoration(
            color: const Color.fromARGB(220, 244, 67, 54),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Text(
            widget.message,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
