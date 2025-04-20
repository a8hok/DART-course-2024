import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RiddleGamePage extends StatefulWidget {
  const RiddleGamePage({super.key});

  @override
  State<RiddleGamePage> createState() => _RiddleGamePageState();
}

class _RiddleGamePageState extends State<RiddleGamePage> {
  final List<Map<String, dynamic>> riddles = [
    {
      "question":
          "I speak without a mouth and hear without ears. I have nobody, but I come alive with the wind. What am I?",
      "answer": "Echo",
      "options": ["Echo", "Wind", "Shadow"]
    },
    {
      "question":
          "I’m tall when I’m young, and I’m short when I’m old. What am I?",
      "answer": "Candle",
      "options": ["Candle", "Tree", "Pencil"]
    },
    {
      "question":
          "The more of me you take, the more you leave behind. What am I?",
      "answer": "Footsteps",
      "options": ["Time", "Footsteps", "Memories"]
    },
    {
      "question": "What has to be broken before you can use it?",
      "answer": "Egg",
      "options": ["Glass", "Egg", "Code"]
    },
    {
      "question":
          "What can travel around the world while staying in the same corner?",
      "answer": "Stamp",
      "options": ["Letter", "Stamp", "Compass"]
    },
  ];

  int riddleIndex = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  String? selectedOption;
  bool hasAnswered = false;

  void _checkAnswer() {
    if (selectedOption == null) return;
    setState(() {
      hasAnswered = true;
      if (selectedOption == riddles[riddleIndex]["answer"]) {
        correctAnswers++;
        // _showCorrectPopup();
      } else {
        wrongAnswers++;
      }
    });
  }

  void _nextRiddle() {
    if (riddleIndex < riddles.length - 1) {
      setState(() {
        riddleIndex++;
        selectedOption = null;
        hasAnswered = false;
      });
    } else {
      _showFinalPopup();
    }
  }

  void _showCorrectPopup() {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Result",
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
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
                  Icons.check_circle,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '🎉 Correct Answer!',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  _nextRiddle();
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
                      riddleIndex == riddles.length - 1 ? "Finish" : "Next",
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

  void _showFinalPopup() {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "FinalResult",
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
                    Color(0xFF7B49FF)
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
                '🎉 Game Completed!',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "✅ Correct: $correctAnswers\n❌ Wrong: $wrongAnswers",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.black87,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // close popup
                      setState(() {
                        riddleIndex = 0;
                        correctAnswers = 0;
                        wrongAnswers = 0;
                        selectedOption = null;
                        hasAnswered = false;
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
                            Color(0xFF7B49FF)
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
                      Navigator.of(context).pop(); // go to Cognitive Home
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
                            Color(0xFF7B49FF)
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

  @override
  Widget build(BuildContext context) {
    final riddle = riddles[riddleIndex];
    final isLast = riddleIndex == riddles.length - 1;

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
            top: 60,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.pop(context),
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
            padding: const EdgeInsets.fromLTRB(30, 180, 30, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Riddle ${riddleIndex + 1} of ${riddles.length}",
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3929C7),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  riddle["question"],
                  style: GoogleFonts.lato(fontSize: 18),
                ),
                const SizedBox(height: 30),
                ...List.generate(riddle["options"].length, (i) {
                  final option = riddle["options"][i];
                  final isSelected = selectedOption == option;

                  Color bgColor;
                  if (hasAnswered) {
                    if (isSelected) {
                      bgColor = const Color.fromARGB(255, 29, 88, 225);
                    } else {
                      bgColor = const Color.fromARGB(
                          255, 255, 255, 255); // keep others normal
                    }
                  } else {
                    bgColor =
                        isSelected ? const Color(0xFF7B49FF) : Colors.white;
                  }

                  return GestureDetector(
                    onTap: () {
                      if (!hasAnswered) {
                        setState(() {
                          selectedOption = option;
                          hasAnswered = true;

                          if (selectedOption == riddle["answer"]) {
                            correctAnswers++;
                          } else {
                            wrongAnswers++;
                          }
                        });
                      }
                    },
                    child: AspectRatio(
                      aspectRatio:
                          6, // adjust this for square or wide buttons (1 for perfect square)
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: hasAnswered
                              ? (selectedOption == option
                                  ? const Color(0xFF1D58E1)
                                  : Colors.white)
                              : (selectedOption == option
                                  ? const Color(0xFF7B49FF)
                                  : Colors.white),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Center(
                          child: Text(
                            option,
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: hasAnswered
                                  ? (selectedOption == option
                                      ? Colors.white
                                      : Colors.black)
                                  : (selectedOption == option
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    if (!hasAnswered) return;

                    if (isLast) {
                      _showFinalPopup();
                    } else {
                      _nextRiddle();
                    }
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
                        hasAnswered ? (isLast ? "Finish" : "Next") : "Next",
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
        ],
      ),
    );
  }
}
