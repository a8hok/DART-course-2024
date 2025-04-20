import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CrossWordGame extends StatefulWidget {
  const CrossWordGame({super.key});

  @override
  State<CrossWordGame> createState() => _CrossWordGameState();
}

class _CrossWordGameState extends State<CrossWordGame> {
  late List<List<String>> grid;
  late List<List<TextEditingController>> controllers;
  late ConfettiController _confettiController;

  int _score = 0;
  int _time = 0;
  late Timer _timer;

  final List<_Word> words = [
    _Word(
        answer: "HELLO",
        row: 0,
        col: 0,
        isAcross: true,
        clue: "Across: A common greeting"),
    _Word(
        answer: "EARTH",
        row: 0,
        col: 0,
        isAcross: false,
        clue: "Down: Our planet"),
    _Word(
        answer: "LEVEL",
        row: 1,
        col: 0,
        isAcross: true,
        clue: "Across: Not sloped"),
    _Word(
        answer: "EVOKE",
        row: 0,
        col: 1,
        isAcross: false,
        clue: "Down: Bring to mind"),
    _Word(
        answer: "LATTE",
        row: 2,
        col: 0,
        isAcross: true,
        clue: "Across: Coffee with milk"),
    _Word(
        answer: "LOVER",
        row: 0,
        col: 2,
        isAcross: false,
        clue: "Down: Romantic partner"),
    _Word(
        answer: "OPERA",
        row: 3,
        col: 0,
        isAcross: true,
        clue: "Across: Dramatic musical work"),
    _Word(
        answer: "TREND",
        row: 0,
        col: 3,
        isAcross: false,
        clue: "Down: Popular direction or style"),
    _Word(
        answer: "EAGLE",
        row: 4,
        col: 0,
        isAcross: true,
        clue: "Across: A powerful bird of prey"),
    _Word(
        answer: "HERBS",
        row: 0,
        col: 4,
        isAcross: false,
        clue: "Down: Plants used in cooking"),
  ];

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
    _initGrid();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _initGrid() {
    grid = List.generate(5, (_) => List.generate(5, (_) => ''));
    controllers = List.generate(
        5, (i) => List.generate(5, (j) => TextEditingController()));
    for (var word in words) {
      for (int i = 0; i < word.answer.length; i++) {
        int row = word.isAcross ? word.row : word.row + i;
        int col = word.isAcross ? word.col + i : word.col;
        grid[row][col] = '_';
      }
    }
  }

  void _checkAnswers() {
    int newScore = 0;
    for (var word in words) {
      String userAnswer = '';
      for (int i = 0; i < word.answer.length; i++) {
        int row = word.isAcross ? word.row : word.row + i;
        int col = word.isAcross ? word.col + i : word.col;
        userAnswer += controllers[row][col].text.toUpperCase();
      }
      if (userAnswer == word.answer) {
        newScore += 10;
      }
    }
    if (newScore > _score) {
      _confettiController.play();
    }
    setState(() {
      _score = newScore;
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _timer.cancel();
    super.dispose();
  }

  Widget _buildCell(int row, int col) {
    bool isWritable = grid[row][col] == '_';
    return Container(
      margin: const EdgeInsets.all(2),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: isWritable ? Colors.white : Colors.grey[300],
      ),
      child: isWritable
          ? TextField(
              controller: controllers[row][col],
              textAlign: TextAlign.center,
              maxLength: 1,
              onChanged: (_) => _checkAnswers(),
              style: const TextStyle(fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  counterText: '', border: InputBorder.none),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _buildGrid() {
    return Column(
      children: List.generate(5, (row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (col) => _buildCell(row, col)),
        );
      }),
    );
  }

  Widget _buildClues() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Clues:", style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
        ...words.map((w) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(w.clue, style: GoogleFonts.lato()),
            )),
      ],
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
              height: 150,
              child: SvgPicture.asset('assets/images/top-curve.svg',
                  fit: BoxFit.cover),
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
              child: SvgPicture.asset('assets/images/bottom-curve.svg',
                  fit: BoxFit.contain),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 70),
              child: Column(
                children: [
                  Text("Crossword",
                      style: GoogleFonts.lato(
                          fontSize: 20, fontWeight: FontWeight.bold)),
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
                  const SizedBox(height: 16),
                  Expanded(child: SingleChildScrollView(child: _buildClues())),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Word {
  final String answer;
  final int row;
  final int col;
  final bool isAcross;
  final String clue;

  _Word(
      {required this.answer,
      required this.row,
      required this.col,
      required this.isAcross,
      required this.clue});
}
