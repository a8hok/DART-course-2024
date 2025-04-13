import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/cognitive_exercises.dart';
import 'pages/daily_planner.dart';
import 'pages/memory_page.dart';
import 'pages/mood_check.dart';
import 'pages/photo_album_page.dart';
import 'profile.dart'; // For the profile page navigation

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(top: 160), // Adjust this value
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Gradient Hello User with tap
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      },
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color(0xFF3929C7),
                            Color(0xFFFA457E),
                            Color(0xFF7B49FF),
                          ],
                        ).createShader(bounds),
                        child: Text(
                          'Hello Raju!',
                          style: GoogleFonts.lato(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Cards
                    buildCard('Daily planner', Icons.calendar_today, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DailyPlannerPage(),
                          ));
                    }),
                    buildCard('Cognitive exercises', Icons.psychology_alt, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const CognitiveExercisesPage(),
                          ));
                    }),
                    buildCard('Mood & Wellness Check', Icons.mood, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MoodCheckPage(),
                          ));
                    }),
                    buildCard('Memory', Icons.memory, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MemoryPage(),
                          ));
                    }),
                    buildCard('Photo album', Icons.photo_album, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PhotoAlbumPage(),
                          ));
                    }),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCard(String text, IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 300,
      height: 50,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color.fromRGBO(229, 214, 255, 1),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 8),
            blurRadius: 20,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(icon, color: Colors.black54),
            const SizedBox(width: 15),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Lato',
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
