import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 252, 255, 1),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 222,
            left: 64,
            child: Text(
              'MEMORY LANE',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Inter',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
