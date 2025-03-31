import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Make it full width
        height: double.infinity, // Make it full height
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8A12C3), // Dark Purple
              Color(0xFFAAA1FF), // Light Purple
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centers content vertically
          children: [
            // Centering the SVG image
            SvgPicture.asset(
              'assets/images/landing-page.svg',
              width: 300, // Adjust size as needed
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 30), // Spacing between image and text

            // Centering the "Memory Lane" text
            Text(
              'Memory Lane',
              textAlign: TextAlign.center,
              style: GoogleFonts.montez(
                fontSize: 55,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
