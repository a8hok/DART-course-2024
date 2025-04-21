import 'package:flutter/material.dart';
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
              Color(0xFF7B49FF), // Light Purple
              Color.fromARGB(255, 239, 133, 166),
              Color(0xFF3929C7),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centers content vertically
          children: [
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
