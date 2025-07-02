import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart'; // Add Lottie package!

class MoodCheckPage extends StatefulWidget {
  const MoodCheckPage({super.key});

  @override
  State<MoodCheckPage> createState() => _MoodCheckPageState();
}

class _MoodCheckPageState extends State<MoodCheckPage> {
  double moodValue = 3;
  double energyValue = 1;
  double sleepValue = 60;

  final List<String> moodEmojis = ['☹️', '🙁', '😕', '😐', '😀', '😃', '😁'];
  final List<String> energyEmojis = ['🧎🏻‍➡️', '🧍🏻', '🚶🏻‍➡️', '🏃🏻‍➡️'];

  // Fake history data
  final List<Map<String, dynamic>> moodHistory = [
    {"date": "26-Apr-2025", "emoji": "😃"},
    {"date": "25-Apr-2025", "emoji": "😀"},
    {"date": "24-Apr-2025", "emoji": "😐"},
    {"date": "23-Apr-2025", "emoji": "😕"},
  ];

  final List<Map<String, dynamic>> energyHistory = [
    {"date": "26-Apr-2025", "emoji": "🏃🏻‍➡️"},
    {"date": "25-Apr-2025", "emoji": "🚶🏻‍➡️"},
    {"date": "24-Apr-2025", "emoji": "🧍🏻"},
    {"date": "23-Apr-2025", "emoji": "🧎🏻‍➡️"},
  ];

  final List<Map<String, dynamic>> sleepHistory = [
    {"date": "26-Apr-2025", "level": "90%"},
    {"date": "25-Apr-2025", "level": "80%"},
    {"date": "24-Apr-2025", "level": "60%"},
    {"date": "23-Apr-2025", "level": "50%"},
  ];

  LinearGradient get gradient => const LinearGradient(
        colors: [
          Color(0xFF3929C7),
          Color(0xFFFA457E),
          Color(0xFF7B49FF),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );

  void _showPopup(BuildContext context, List<Map<String, dynamic>> historyList,
      String title,
      {bool isSleep = false}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Lottie.asset('assets/animations/celebration2.json', height: 150),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: historyList.length,
            itemBuilder: (context, index) {
              final item = historyList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item["date"], style: const TextStyle(fontSize: 16)),
                    Text(isSleep ? item["level"] : item["emoji"],
                        style: const TextStyle(fontSize: 34)),
                  ],
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Close'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
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

          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      'Mood Check!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Mood Checker
                    _buildMoodChecker(),

                    const SizedBox(height: 20),

                    _buildEnergyTracker(),

                    const SizedBox(height: 20),

                    _buildSleepTracker(),

                    const SizedBox(height: 20),
                  ],
                ),
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
        ],
      ),
    );
  }

  Widget _buildMoodChecker() {
    return GestureDetector(
      onTap: () => _showPopup(context, moodHistory, "Mood History"),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: _boxDecoration(),
        child: Column(
          children: [
            Text(
              'How are you feeling?',
              style:
                  GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ShaderMask(
              shaderCallback: (bounds) => gradient.createShader(bounds),
              child: Slider(
                value: moodValue,
                min: 0,
                max: 6,
                divisions: 6,
                onChanged: (value) {
                  setState(() {
                    moodValue = value;
                  });
                },
                activeColor: Colors.white,
                inactiveColor: Colors.white.withOpacity(0.3),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              moodEmojis[moodValue.round()],
              style: const TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnergyTracker() {
    return GestureDetector(
      onTap: () => _showPopup(context, energyHistory, "Energy History"),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: _boxDecoration(),
        child: Column(
          children: [
            Text(
              'Track your Energy',
              style:
                  GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ShaderMask(
              shaderCallback: (bounds) => gradient.createShader(bounds),
              child: Slider(
                value: energyValue,
                min: 0,
                max: 3,
                divisions: 3,
                onChanged: (value) {
                  setState(() {
                    energyValue = value;
                  });
                },
                activeColor: Colors.white,
                inactiveColor: Colors.white.withOpacity(0.3),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              energyEmojis[energyValue.round()],
              style: const TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepTracker() {
    return GestureDetector(
      onTap: () =>
          _showPopup(context, sleepHistory, "Sleep History", isSleep: true),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: _boxDecoration(),
        child: Column(
          children: [
            Text(
              'Track your Sleep',
              style:
                  GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ShaderMask(
              shaderCallback: (bounds) => gradient.createShader(bounds),
              child: Slider(
                value: sleepValue,
                min: 0,
                max: 100,
                divisions: 5,
                label: '${sleepValue.round()}%',
                onChanged: (value) {
                  setState(() {
                    sleepValue = value;
                  });
                },
                activeColor: Colors.white,
                inactiveColor: Colors.white.withOpacity(0.3),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${sleepValue.round()}% Sleep Quality',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
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
}
