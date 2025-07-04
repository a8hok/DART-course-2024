// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:memory_sample/screens/auth_service.dart';
// import 'package:memory_sample/screens/login.dart';

// class CreateAccountPage extends StatefulWidget {
//   const CreateAccountPage({super.key});

//   @override
//   State<CreateAccountPage> createState() => _CreateAccountPageState();
// }

// class _CreateAccountPageState extends State<CreateAccountPage> {
//   final _formKey = GlobalKey<FormState>();

//   final _usernameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _mobileController = TextEditingController();
//   final _passwordController = TextEditingController();

//   final AuthService _authService = AuthService();
//   bool _hasShownToast = false;
//   bool _hasValidationError = false;

//   void _showToast(String message) {
//     if (_hasShownToast) return;
//     _hasShownToast = true;

//     final overlay = Overlay.of(context);
//     final overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         top: 60,
//         right: 20,
//         child: SlideToast(message: message),
//       ),
//     );

//     overlay.insert(overlayEntry);

//     Future.delayed(const Duration(seconds: 2), () {
//       overlayEntry.remove();
//     });
//   }

//   void _handleSignup() {
//     _hasShownToast = false;
//     _hasValidationError = false;
//     _formKey.currentState!.validate(); // run all validators

//     if (!_hasValidationError) {
//       _authService.signup(
//         email: _emailController.text.trim(),
//         password: _passwordController.text,
//         context: context,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: SizedBox(
//               height: 150,
//               child: SvgPicture.asset(
//                 'assets/images/top-curve.svg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 40,
//             left: 20,
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 60),
//                       Text(
//                         'Create Account!',
//                         style: GoogleFonts.lato(
//                           fontSize: 30,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 40),
//                       // Username
//                       _buildTextField(
//                         controller: _usernameController,
//                         hint: 'Username',
//                         icon: Icons.person,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             if (!_hasShownToast)
//                               _showToast('Please enter a username');
//                             _hasShownToast = true;
//                             _hasValidationError = true;
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),

// // Email (already done correctly)
//                       _buildTextField(
//                         controller: _emailController,
//                         hint: 'Email',
//                         icon: Icons.email,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             if (!_hasShownToast)
//                               _showToast('Please enter an email');
//                             _hasShownToast = true;
//                             _hasValidationError = true;
//                           } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
//                               .hasMatch(value)) {
//                             if (!_hasShownToast)
//                               _showToast('Invalid email format');
//                             _hasShownToast = true;
//                             _hasValidationError = true;
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),

// // Mobile
//                       _buildTextField(
//                         controller: _mobileController,
//                         hint: 'Mobile',
//                         icon: Icons.phone,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             if (!_hasShownToast)
//                               _showToast('Please enter a mobile number');
//                             _hasShownToast = true;
//                             _hasValidationError = true;
//                           } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
//                             if (!_hasShownToast)
//                               _showToast('Mobile number must be 10 digits');
//                             _hasShownToast = true;
//                             _hasValidationError = true;
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 20),

// // Password
//                       _buildTextField(
//                         controller: _passwordController,
//                         hint: 'Password',
//                         icon: Icons.lock,
//                         obscureText: true,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             if (!_hasShownToast)
//                               _showToast('Please enter a password');
//                             _hasShownToast = true;
//                             _hasValidationError = true;
//                           } else if (value.length < 6) {
//                             if (!_hasShownToast)
//                               _showToast(
//                                   'Password must be at least 6 characters');
//                             _hasShownToast = true;
//                             _hasValidationError = true;
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 40),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ShaderMask(
//                             shaderCallback: (bounds) => const LinearGradient(
//                               colors: [
//                                 Color(0xFF3929C7),
//                                 Color(0xFFFA457E),
//                                 Color(0xFF7B49FF),
//                               ],
//                             ).createShader(bounds),
//                             child: const Text(
//                               'Create',
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 fontFamily: 'Lato',
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           GestureDetector(
//                             onTap: _handleSignup,
//                             child: Container(
//                               padding: const EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 gradient: const LinearGradient(
//                                   colors: [
//                                     Color(0xFFF977D6),
//                                     Color(0xFF623AA2),
//                                   ],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               child: const Icon(
//                                 Icons.arrow_forward,
//                                 color: Colors.white,
//                                 size: 22,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 60),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const LoginPage()),
//                           );
//                         },
//                         child: Text.rich(
//                           TextSpan(
//                             text: "Already have an account? ",
//                             style: GoogleFonts.lato(
//                               fontSize: 15,
//                               color: Colors.black,
//                             ),
//                             children: [
//                               TextSpan(
//                                 text: "Sign In",
//                                 style: GoogleFonts.lato(
//                                   fontSize: 15,
//                                   color: Colors.blue,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 50),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: -312,
//             right: 0,
//             child: SizedBox(
//               height: 300,
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

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hint,
//     required IconData icon,
//     required String? Function(String?) validator,
//     bool obscureText = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF686868).withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         validator: validator,
//         style: const TextStyle(color: Colors.black),
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: Colors.white,
//           prefixIcon: Icon(icon, color: Colors.black),
//           hintText: hint,
//           hintStyle: const TextStyle(color: Colors.black87),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SlideToast extends StatefulWidget {
//   final String message;

//   const SlideToast({super.key, required this.message});

//   @override
//   State<SlideToast> createState() => _SlideToastState();
// }

// class _SlideToastState extends State<SlideToast>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       vsync: this,
//     );
//     _offsetAnimation = Tween<Offset>(
//       begin: const Offset(1.5, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//     _controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _offsetAnimation,
//       child: Material(
//         color: Colors.transparent,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//           margin: const EdgeInsets.only(top: 60),
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(220, 244, 67, 54),
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 blurRadius: 6,
//               ),
//             ],
//           ),
//           child: Text(
//             widget.message,
//             style: const TextStyle(color: Colors.white, fontSize: 15),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_sample/screens/auth_service.dart';
import 'package:memory_sample/screens/login.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  bool _hasShownToast = false;
  bool _hasValidationError = false;
  bool _isLoading = false;

  void _showToast(String message) {
    if (_hasShownToast) return;
    _hasShownToast = true;

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 60,
        right: 20,
        child: SlideToast(message: message),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  void _handleSignup() async {
    _hasShownToast = false;
    _hasValidationError = false;
    _formKey.currentState!.validate(); // run all validators

    if (!_hasValidationError) {
      setState(() => _isLoading = true);
      await _authService.signup(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        context: context,
      );
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
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
                        'Create Account!',
                        style: GoogleFonts.lato(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      _buildTextField(
                        controller: _usernameController,
                        hint: 'Username',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            if (!_hasShownToast)
                              _showToast('Please enter a username');
                            _hasValidationError = true;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _emailController,
                        hint: 'Email',
                        icon: Icons.email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            if (!_hasShownToast)
                              _showToast('Please enter an email');
                            _hasValidationError = true;
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                              .hasMatch(value)) {
                            if (!_hasShownToast)
                              _showToast('Invalid email format');
                            _hasValidationError = true;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _mobileController,
                        hint: 'Mobile',
                        icon: Icons.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            if (!_hasShownToast)
                              _showToast('Please enter a mobile number');
                            _hasValidationError = true;
                          } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                            if (!_hasShownToast)
                              _showToast('Mobile number must be 10 digits');
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
                            if (!_hasShownToast)
                              _showToast('Please enter a password');
                            _hasValidationError = true;
                          } else if (value.length < 6) {
                            if (!_hasShownToast)
                              _showToast(
                                  'Password must be at least 6 characters');
                            _hasValidationError = true;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [
                                Color(0xFF3929C7),
                                Color(0xFFFA457E),
                                Color(0xFF7B49FF)
                              ],
                            ).createShader(bounds),
                            child: const Text(
                              'Create',
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
                            onTap: _handleSignup,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFF977D6),
                                    Color(0xFF623AA2)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(Icons.arrow_forward,
                                  color: Colors.white, size: 22),
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
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Sign In",
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
          if (_isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.4),
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
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
}

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
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          margin: const EdgeInsets.only(top: 60),
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
