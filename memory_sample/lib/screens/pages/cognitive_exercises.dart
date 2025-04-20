import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../games/cross_word.dart';
import '../games/guess_pattern.dart';
import '../games/riddle_game.dart';

class CognitiveExercisesPage extends StatefulWidget {
  const CognitiveExercisesPage({super.key});

  @override
  State<CognitiveExercisesPage> createState() => _CognitiveExercisesPageState();
}

class _CognitiveExercisesPageState extends State<CognitiveExercisesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late ConfettiController _confettiController;
  late List<Map<String, dynamic>> streaks;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));

    _controller.forward();
    _confettiController.play();

    generateStreaks();
  }

  void generateStreaks() {
    final now = DateTime.now();
    streaks = List.generate(7, (index) {
      final day = now.subtract(Duration(days: 6 - index));
      final formattedDay = DateFormat('EEE').format(day); // Mon, Tue, etc.
      final active = day.day % 2 == 0; // Simulated logic
      return {"day": formattedDay, "active": active};
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  Widget _buildStreakDay(String day, bool active) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: active
              ? const Color.fromARGB(255, 237, 124, 49)
              : Colors.grey[300],
          child: Icon(
            active ? Icons.check : Icons.close,
            color: active ? Colors.white : Colors.grey[600],
            size: 20,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          day,
          style: TextStyle(
            fontSize: 12,
            color: active ? Colors.black : Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
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
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Cognitive Exercises!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Sparkle Confetti + Streak Image
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ConfettiWidget(
                        confettiController: _confettiController,
                        blastDirectionality: BlastDirectionality.explosive,
                        shouldLoop: false,
                        emissionFrequency: 0.03,
                        numberOfParticles: 10,
                        maxBlastForce: 10,
                        minBlastForce: 5,
                        gravity: 0.1,
                      ),
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'assets/images/streak.png',
                              height: 150,
                              width: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "You're on a 4-day streak!",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Streak Days
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: streaks
                        .map((s) => _buildStreakDay(s['day'], s['active']))
                        .toList(),
                  ),

                  const SizedBox(height: 40),

                  // Game Buttons
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PatternMatchingGame(),
                            ),
                          );
                        },
                        child: _buildGradientButton("🧩 Guess Pattern"),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RiddleGamePage(),
                            ),
                          );
                        },
                        child: _buildGradientButton("❓ Riddle Game"),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CrossWordGame(),
                            ),
                          );
                        },
                        child: _buildGradientButton("✍️ Crossword Puzzle"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientButton(String text) {
    return Container(
      width: 300,
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF3929C7),
            Color.fromARGB(255, 237, 136, 168),
            Color(0xFF7B49FF),
          ],
        ),
      ),
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Colors.white, Colors.white],
        ).createShader(bounds),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
