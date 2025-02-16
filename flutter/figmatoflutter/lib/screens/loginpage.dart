import 'package:flutter/material.dart';

import 'signuppage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 252, 255, 1),
      body: Stack(
        children: [
          Positioned(
            top: 26,
            left: 0,
            child: Container(
              width: 152,
              height: 152,
              decoration: BoxDecoration(
                color: Color.fromRGBO(197, 250, 246, 1),
                borderRadius: BorderRadius.all(Radius.elliptical(152, 152)),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 117,
            child: Container(
              width: 152,
              height: 152,
              decoration: BoxDecoration(
                color: Color.fromRGBO(197, 250, 246, 1),
                borderRadius: BorderRadius.all(Radius.elliptical(152, 152)),
              ),
            ),
          ),
          Positioned(
            top: 222,
            left: 64,
            child: Text(
              'MEMORY LANE',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Inter',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 344,
            left: 61,
            child: Container(
              width: 259,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 412,
            left: 61,
            child: Container(
              width: 255,
              height: 51,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 488,
            left: 79,
            child: GestureDetector(
              onTap: () {
                // Handle login logic here
              },
              child: Container(
                width: 114,
                height: 39,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 617,
            left: 64,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: 'New User? ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up here',
                      style: const TextStyle(
                        color: Colors.blue, // Only "Sign Up here" will be blue
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
