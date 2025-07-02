import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CrossWordGame extends StatefulWidget {
  const CrossWordGame({Key? key}) : super(key: key);

  @override
  State<CrossWordGame> createState() => _CrossWordGameState();
}

class _CrossWordGameState extends State<CrossWordGame> {
  late List<List<String>> solution;
  late List<List<TextEditingController>> controllers;
  late ConfettiController _confettiController;
  late Timer _timer;
  int _score = 0;
  int _time = 0;
  bool _isCompleted = false;
  int _level = 1;

  final Map<int, Map<String, dynamic>> levels = {
    1: {
      'solution': [
        ['H', 'E', 'L', 'L', 'O'],
        ['E', 'V', 'O', 'K', 'E'],
        ['L', 'A', 'T', 'T', 'E'],
        ['L', 'O', 'V', 'E', 'R'],
        ['O', 'P', 'E', 'R', 'A'],
      ],
      'acrossClues': [
        '1. Greeting word',
        '2. Summon emotions',
        '3. Coffee variety',
        '4. Romantic partner',
        '5. Musical drama',
      ],
      'downClues': [
        '1. Starts with H',
        '2. Sound alike word (Evoke)',
        '3. Espresso with milk',
        '4. Heart connection',
        '5. Stage performance',
      ],
    },
    2: {
      'solution': [
        ['B', 'R', 'A', 'I', 'N'],
        ['R', 'A', 'I', 'N', 'S'],
        ['A', 'S', 'H', 'E', 'S'],
        ['I', 'N', 'K', 'S', 'Y'],
        ['N', 'E', 'S', 'T', 'S'],
      ],
      'acrossClues': [
        '1. Controls thinking',
        '2. Falls from sky',
        '3. Remains after fire',
        '4. Used for writing',
        '5. Birds\' homes',
      ],
      'downClues': [
        '1. Mind organ',
        '2. Water droplets',
        '3. Burnt powder',
        '4. Pen material',
        '5. Trees\' habitat',
      ],
    }
  };

  List<String> acrossClues = [];
  List<String> downClues = [];

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
    _startLevel();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _startLevel() {
    var levelData = levels[_level]!;
    solution = List<List<String>>.from(levelData['solution']);
    acrossClues = List<String>.from(levelData['acrossClues']);
    downClues = List<String>.from(levelData['downClues']);
    controllers = List.generate(
        solution.length,
        (i) =>
            List.generate(solution[i].length, (j) => TextEditingController()));
    setState(() {
      _isCompleted = false;
      _score = 0;
    });
  }

  void _checkAnswers() {
    bool allCorrect = true;
    int filledCells = 0;

    for (int i = 0; i < solution.length; i++) {
      for (int j = 0; j < solution[i].length; j++) {
        String userInput = controllers[i][j].text.trim().toUpperCase();
        if (userInput.isNotEmpty) {
          filledCells++;
        }
        if (userInput != solution[i][j]) {
          allCorrect = false;
        }
      }
    }

    if (filledCells == 0) {
      _showResultDialog(false, message: "Please fill the crossword first.");
      return;
    }

    if (allCorrect) {
      _confettiController.play();
      setState(() {
        _score = 100;
        _isCompleted = true;
      });
      _showResultDialog(true);
    } else {
      _showResultDialog(false);
    }
  }

  void _showResultDialog(bool isSuccess, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(isSuccess ? "🎉 Congratulations!" : "❌ Try Again"),
        content: Text(message ??
            (isSuccess
                ? "You completed the crossword!"
                : "Some answers are wrong, please try again.")),
        actions: isSuccess
            ? [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // close dialog
                    if (_level < levels.length) {
                      _level++;
                      _startLevel();
                    } else {
                      _showFinishedDialog();
                    }
                  },
                  child: const Text("Next Level"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // close popup
                    Navigator.of(context).pop(); // go back to Home
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
              ]
            : [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
      ),
    );
  }

  void _showFinishedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("🎉 All Levels Completed!"),
        content: const Text("You have completed all crosswords!"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
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
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _timer.cancel();
    super.dispose();
  }

  Widget _buildCell(int row, int col) {
    return Container(
      margin: const EdgeInsets.all(2),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
      ),
      child: TextField(
        controller: controllers[row][col],
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return Column(
      children: List.generate(solution.length, (row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              solution[row].length, (col) => _buildCell(row, col)),
        );
      }),
    );
  }

  Widget _buildConfetti() {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: _confettiController,
        blastDirectionality: BlastDirectionality.explosive,
        gravity: 0.3,
        colors: const [Colors.green, Colors.blue, Colors.purple, Colors.orange],
      ),
    );
  }

  Widget _buildClues() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Across",
            style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold)),
        ...acrossClues.map((clue) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(clue, style: GoogleFonts.lato()),
            )),
        const SizedBox(height: 16),
        Text("Down",
            style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold)),
        ...downClues.map((clue) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(clue, style: GoogleFonts.lato()),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildConfetti(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 140,
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 70),
              child: Column(
                children: [
                  Text("Crossword Level $_level",
                      style: GoogleFonts.lato(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Time: $_time sec",
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                      Text("Score: $_score",
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Flexible(child: _buildGrid()),
                  const SizedBox(height: 0),
                  Expanded(child: SingleChildScrollView(child: _buildClues())),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 1.0), // Add nice space around
                    child: GestureDetector(
                      onTap: _checkAnswers,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
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
                            "✅ Check Answers",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
