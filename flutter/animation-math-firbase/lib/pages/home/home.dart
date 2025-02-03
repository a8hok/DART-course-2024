// import 'dart:math';

// import 'package:firbase_connecting/services/auth_service.dart';
// import 'package:firbase_connecting/util/const.dart';
// import 'package:firbase_connecting/util/my_button.dart';
// import 'package:firbase_connecting/util/result_message.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<String> numpad = [
//     '7',
//     '8',
//     '9',
//     'C',
//     '4',
//     '5',
//     '6',
//     'DEL',
//     '1',
//     '2',
//     '3',
//     '=',
//     '0',
//     '-',
//   ];

//   int a = 1, b = 1;
//   String operation = '+';
//   String userAnswer = '';
//   final Random randomNumber = Random();

//   void buttonTapped(String button) {
//     setState(() {
//       if (button == '=' && userAnswer.isNotEmpty) {
//         checkResult();
//       } else if (button == 'C') {
//         userAnswer = '';
//       } else if (button == 'DEL' && userAnswer.isNotEmpty) {
//         userAnswer = userAnswer.substring(0, userAnswer.length - 1);
//       } else if (userAnswer.length < 3 &&
//           button != '=' &&
//           button != 'C' &&
//           button != 'DEL') {
//         userAnswer += button;
//       }
//     });
//   }

//   void checkResult() {
//     if (userAnswer.isEmpty) return;

//     int? userAnswerInt = int.tryParse(userAnswer);
//     if (userAnswerInt == null) return;

//     int correctAnswer;
//     switch (operation) {
//       case '+':
//         correctAnswer = a + b;
//         break;
//       case '-':
//         correctAnswer = a - b;
//         break;
//       case '×':
//         correctAnswer = a * b;
//         break;
//       case '÷':
//         correctAnswer = (b != 0 && a % b == 0) ? a ~/ b : -1;
//         break;
//       default:
//         correctAnswer = 0;
//     }

//     showDialog(
//       context: context,
//       builder: (context) => ResultMessage(
//         message: userAnswerInt == correctAnswer
//             ? 'Hurray! You got it'
//             : 'Sorry! Try Again',
//         onTap: userAnswerInt == correctAnswer
//             ? goToNextQuestion
//             : goBackToQuestion,
//         icon: userAnswerInt == correctAnswer
//             ? Icons.arrow_forward
//             : Icons.rotate_left,
//       ),
//     );
//   }

//   void goToNextQuestion() {
//     Navigator.of(context).pop();
//     setState(() {
//       userAnswer = '';
//       a = randomNumber.nextInt(10);
//       b = randomNumber.nextInt(10);
//       List<String> operations = ['+', '-', '×', '÷'];
//       operation = operations[randomNumber.nextInt(operations.length)];
//       if (operation == '÷') {
//         while (b == 0 || a % b != 0) {
//           a = randomNumber.nextInt(10);
//           b = randomNumber.nextInt(10);
//         }
//       }
//     });
//   }

//   void goBackToQuestion() => Navigator.of(context).pop();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Hello👋',
//                   style: GoogleFonts.raleway(
//                       textStyle: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20))),
//               const SizedBox(height: 10),
//               Text(FirebaseAuth.instance.currentUser!.email!.toString(),
//                   style: GoogleFonts.raleway(
//                       textStyle: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20))),
//               const SizedBox(height: 10),
//               // Container(
//               //   height: 40,
//               //   color: Colors.deepPurple,
//               // ),
//               Expanded(
//                 child: Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('$a $operation $b = ',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 32,
//                           )),
//                       Container(
//                         height: 60,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           color: Colors.deepPurple.shade400,
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         child: Center(
//                             child: Text(userAnswer, style: whiteTextStyle)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 4),
//                     itemCount: numpad.length,
//                     itemBuilder: (context, index) => MyButton(
//                       child: numpad[index],
//                       onTap: () => buttonTapped(numpad[index]),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               _logout(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _logout(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.deepPurple.shade400,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//         minimumSize: const Size(double.infinity, 60),
//         elevation: 0,
//       ),
//       onPressed: () async {
//         await AuthService().signout(context: context);
//       },
//       child: const Text("Sign Out", style: TextStyle(color: Colors.white)),
//     );
//   }
// }
import 'dart:math';

import 'package:animations/animations.dart';
import 'package:firbase_connecting/services/auth_service.dart';
import 'package:firbase_connecting/util/const.dart';
import 'package:firbase_connecting/util/my_button.dart';
import 'package:firbase_connecting/util/result_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> numpad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
    '-',
  ];

  int a = 1, b = 1;
  String operation = '+';
  String userAnswer = '';
  final Random randomNumber = Random();

  void buttonTapped(String button) {
    setState(() {
      if (button == '=' && userAnswer.isNotEmpty) {
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL' && userAnswer.isNotEmpty) {
        userAnswer = userAnswer.substring(0, userAnswer.length - 1);
      } else if (userAnswer.length < 3 &&
          button != '=' &&
          button != 'C' &&
          button != 'DEL') {
        userAnswer += button;
      }
    });
  }

  void checkResult() {
    if (userAnswer.isEmpty) return;

    int? userAnswerInt = int.tryParse(userAnswer);
    if (userAnswerInt == null) return;

    int correctAnswer;
    switch (operation) {
      case '+':
        correctAnswer = a + b;
        break;
      case '-':
        correctAnswer = a - b;
        break;
      case '×':
        correctAnswer = a * b;
        break;
      case '÷':
        correctAnswer = (b != 0 && a % b == 0) ? a ~/ b : -1;
        break;
      default:
        correctAnswer = 0;
    }

    showDialog(
      context: context,
      builder: (context) => ResultMessage(
        message: userAnswerInt == correctAnswer
            ? 'Hurray! You got it'
            : 'Sorry! Try Again',
        onTap: userAnswerInt == correctAnswer
            ? goToNextQuestion
            : goBackToQuestion,
        icon: userAnswerInt == correctAnswer
            ? Icons.arrow_forward
            : Icons.rotate_left,
      ),
    );
  }

  void goToNextQuestion() {
    Navigator.of(context).pop();
    setState(() {
      userAnswer = '';
      a = randomNumber.nextInt(10);
      b = randomNumber.nextInt(10);
      List<String> operations = ['+', '-', '×', '÷'];
      operation = operations[randomNumber.nextInt(operations.length)];
      if (operation == '÷') {
        while (b == 0 || a % b != 0) {
          a = randomNumber.nextInt(10);
          b = randomNumber.nextInt(10);
        }
      }
    });
  }

  void goBackToQuestion() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello👋',
                  style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              const SizedBox(height: 10),
              Text(FirebaseAuth.instance.currentUser!.email!.toString(),
                  style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              const SizedBox(height: 10),
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$a $operation $b = ',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          )),
                      Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade400,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                            child: Text(userAnswer, style: whiteTextStyle)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemCount: numpad.length,
                    itemBuilder: (context, index) => MyButton(
                      child: numpad[index],
                      onTap: () => buttonTapped(numpad[index]),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _logout(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logout(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough, // Smooth animation
      closedColor: Colors.deepPurple.shade400,
      closedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      closedElevation: 0,
      openBuilder: (context, action) =>
          const LogoutScreen(), // Redirects to Logout UI
      closedBuilder: (context, action) => SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple.shade400,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            elevation: 0,
          ),
          onPressed: action, // Triggers the animation
          child: const Text(
            "Sign Out",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

// Dummy logout screen (replace with actual logout logic)
class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      await AuthService().signout(context: context);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(), // Shows loading effect
            const SizedBox(height: 20),
            const Text("Signing out...", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
