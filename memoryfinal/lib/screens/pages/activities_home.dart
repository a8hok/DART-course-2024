import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'activities.dart';
import 'relaxation.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

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

          // Back button
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

          // Main content
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Activities and Relaxation!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildActivities(context),
                    const SizedBox(height: 30),
                    _buildRelaxation(context),
                  ],
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

Widget _buildActivities(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Activities()),
      );
    },
    child: Container(
      width: 300,
      height: 120,
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Center(
        child: Text(
          'Activities',
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}

Widget _buildRelaxation(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Relaxation()),
      );
    },
    child: Container(
      width: 300,
      height: 120,
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Center(
        child: Text(
          'Relaxation',
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}

BoxDecoration _boxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        spreadRadius: 5,
        offset: Offset(0, 4),
      ),
    ],
  );
}
