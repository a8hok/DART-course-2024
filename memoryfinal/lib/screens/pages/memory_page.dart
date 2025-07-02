import 'dart:io';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class MemoryPage extends StatefulWidget {
  const MemoryPage({super.key});

  @override
  State<MemoryPage> createState() => _MemoryPageState();
}

class _MemoryPageState extends State<MemoryPage>
    with SingleTickerProviderStateMixin {
  File? _imageFile;
  bool _showFirstTimeAnimation = true;
  late ConfettiController _confettiController;
  late AnimationController _bounceController;
  late Animation<double> _scaleAnimation;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _confettiController.play();
      _bounceController.forward(from: 0);
    }
  }

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2));

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0.8,
      upperBound: 1.0,
    );

    _scaleAnimation =
        CurvedAnimation(parent: _bounceController, curve: Curves.elasticOut);

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showFirstTimeAnimation = false;
      });
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _bounceController.dispose();
    super.dispose();
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
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 0),

                  Text(
                    'Memory Of the Day!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 80),

                  // Stack for image + lottie + confetti
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: _imageFile != null
                                  ? FileImage(_imageFile!) as ImageProvider
                                  : const AssetImage(
                                      'assets/images/placeholder1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      if (_showFirstTimeAnimation)
                        SizedBox(
                          width: 250,
                          height: 250,
                          child: Lottie.asset(
                            'assets/animations/celebrations.json',
                            fit: BoxFit.contain,
                          ),
                        ),

                      // Confetti over the image
                      Positioned.fill(
                        child: ConfettiWidget(
                          confettiController: _confettiController,
                          blastDirectionality: BlastDirectionality.explosive,
                          shouldLoop: false,
                          colors: const [
                            Color(0xFF3929C7),
                            Color(0xFFFA457E),
                            Color(0xFF7B49FF),
                            Colors.green,
                            Colors.orange,
                          ],
                          maxBlastForce: 20,
                          minBlastForce: 10,
                          emissionFrequency: 0.05,
                          numberOfParticles: 20,
                          gravity: 0.3,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30), // Controlled spacing

                  // Upload button
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF3929C7),
                            Color(0xFFFA457E),
                            Color(0xFF7B49FF),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Upload Image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
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
