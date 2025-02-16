import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'loginpage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(221, 252, 255, 1),
        body: Stack(children: [
          Positioned(
              top: -50,
              left: -100,
              child: CircleAvatar(radius: 80, backgroundColor: Colors.teal)),
          Positioned(
              top: -90,
              left: -30,
              child: CircleAvatar(radius: 80, backgroundColor: Colors.teal)),
          Positioned(
              top: 100,
              left: 70,
              child: Text(
                'MEMORY LANE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Positioned(
              top: 180,
              left: 70,
              child: SizedBox(
                  width: 250,
                  child: Text(
                    'Memory lane is the beautiful place where can find yourself refreshed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),
                  ))),
          Positioned(
            top: 300,
            left: 100,
            child: SvgPicture.asset(
              'assets/images/front-image.svg',
              width: 300,
              height: 200,
            ),
          ),

          // Start Button
          Positioned(
            bottom: 120,
            left: 110,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'Start Here',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
        ]));
  }
}
