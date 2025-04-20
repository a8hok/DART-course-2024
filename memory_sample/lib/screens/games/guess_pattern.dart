import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PatternMatchingGame extends StatefulWidget {
  const PatternMatchingGame({super.key});

  @override
  State<PatternMatchingGame> createState() => _PatternMatchingGameState();
}

class _PatternMatchingGameState extends State<PatternMatchingGame> {
  final List<List<int>> patterns = [
    [2, 6, 12, 20], // 30
    [3, 9, 27, 81], // 243
    [1, 4, 9, 16], // 25
    [10, 20, 40, 80], // 160
    [2, 3, 5, 8], // 12
    [1, 2, 4, 7], // 11
    [2, 3, 5, 7], // 11
    [1, 8, 27, 64], // 125
    [13, 11, 9, 7], // 5
    [5, 10, 17, 26], // 37
  ];

  late List<int> currentPattern;
  late int correctAnswer;
  late List<int> options;
  String feedback = "";
  int correctCount = 0;
  int wrongCount = 0;
  int questionIndex = 0;
  int? selectedOption;

  @override
  void initState() {
    super.initState();
    _loadNextPattern();
  }

  void _loadNextPattern() {
    if (questionIndex < patterns.length) {
      currentPattern = patterns[questionIndex];
      correctAnswer = _calculateNext(currentPattern);
      selectedOption = null;
      feedback = "";
      options = _generateOptions(correctAnswer);
    } else {
      _showResultPopup();
    }
  }

  int _calculateNext(List<int> pattern) {
    int diff = pattern[1] - pattern[0];
    bool isArithmetic = true;

    for (int i = 1; i < pattern.length - 1; i++) {
      if (pattern[i + 1] - pattern[i] != diff) {
        isArithmetic = false;
        break;
      }
    }

    if (isArithmetic) {
      return pattern.last + diff;
    } else {
      int ratio = pattern[1] ~/ pattern[0];
      bool isGeometric = true;

      for (int i = 1; i < pattern.length - 1; i++) {
        if (pattern[i + 1] ~/ pattern[i] != ratio) {
          isGeometric = false;
          break;
        }
      }

      if (isGeometric) {
        return pattern.last * ratio;
      } else {
        List<int> diffs = [];
        for (int i = 1; i < pattern.length; i++) {
          diffs.add(pattern[i] - pattern[i - 1]);
        }
        int lastDiff = diffs.isNotEmpty ? diffs.last + 2 : 1;
        return pattern.last + lastDiff;
      }
    }
  }

  List<int> _generateOptions(int correct) {
    final random = Random();
    Set<int> optionsSet = {correct};
    while (optionsSet.length < 3) {
      int option = correct + random.nextInt(15) - 7;
      if (option != correct && option > 0) {
        optionsSet.add(option);
      }
    }
    List<int> optionsList = optionsSet.toList();
    optionsList.shuffle();
    return optionsList;
  }

  void _nextQuestion() {
    if (selectedOption == null) return;

    setState(() {
      if (selectedOption == correctAnswer) {
        feedback = "🎉 Correct!";
        correctCount++;
      } else {
        feedback = "❌ Wrong! Answer: $correctAnswer";
        wrongCount++;
      }
    });

    Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        questionIndex++;
        _loadNextPattern();
      });
    });
  }

  void _showResultPopup() {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Result",
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    Color(0xFF3929C7),
                    Color(0xFFFA457E),
                    Color(0xFF7B49FF),
                  ],
                ).createShader(bounds),
                child: const Icon(
                  Icons.emoji_events,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '🎯 Game Over!',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "✅ Correct: $correctCount\n❌ Wrong: $wrongCount",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.black87,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(); // close popup
                  setState(() {
                    correctCount = 0;
                    wrongCount = 0;
                    questionIndex = 0;
                    _loadNextPattern(); // reset the game
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF3929C7),
                        Color(0xFFFA457E),
                        Color(0xFF7B49FF),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "🔁 Play Again",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(); // close popup
                  Navigator.of(context).pop(); // go back to Cognitive Home
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF3929C7),
                        Color(0xFFFA457E),
                        Color(0xFF7B49FF),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "🏠 Go to Cognitive Home",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
          child: FadeTransition(opacity: anim, child: child),
        );
      },
    );
  }

  Widget _buildOption(int value) {
    bool isSelected = value == selectedOption;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = value;
        });
      },
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isSelected
              ? const LinearGradient(
                  colors: [
                    Color(0xFF3929C7),
                    Color.fromARGB(255, 77, 85, 242),
                    Color.fromARGB(255, 107, 63, 230),
                  ],
                )
              : null,
          color: isSelected ? null : const Color.fromARGB(255, 254, 222, 229),
        ),
        child: Center(
          child: Text(
            "$value",
            style: GoogleFonts.lato(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
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
          // Curves
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
            top: 60,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          Positioned(
            bottom: 0,
            left: -280,
            right: 0,
            child: SizedBox(
              height: 300,
              child: SvgPicture.asset(
                'assets/images/bottom-curve.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(30, 190, 30, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  "Complete the Pattern",
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3929C7),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  currentPattern.join(", ") + ", ?",
                  style: GoogleFonts.lato(fontSize: 22),
                ),
                const SizedBox(height: 30),
                // ...options.map(_buildOption).toList(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: options.map((opt) => _buildOption(opt)).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _nextQuestion,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF3929C7),
                          Color(0xFFFA457E),
                          Color(0xFF7B49FF),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        questionIndex == patterns.length - 1
                            ? "Finish"
                            : "Next",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Text(
                //   feedback,
                //   style: GoogleFonts.lato(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: feedback.contains("Correct")
                //         ? Colors.green
                //         : Colors.red,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
