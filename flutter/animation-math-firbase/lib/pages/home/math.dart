import 'dart:math';

import 'package:firbase_connecting/util/const.dart';
import 'package:firbase_connecting/util/my_button.dart';
import 'package:firbase_connecting/util/result_message.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // User answer
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

  // Number A, number B, and operation
  int a = 1, b = 1;
  String operation = '+';
  String userAnswer = '';
  final Random randomNumber = Random();

  void buttonTapped(String button) {
    setState(() {
      if (button == '=' && userAnswer.isEmpty) {
        userAnswer = '';
      } else if (button == '=' && userAnswer.isNotEmpty) {
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      }
      // Maximum of 3-digit numbers
      else if (userAnswer.length < 3) {
        userAnswer += button;
      }
    });
  }

  void checkResult() {
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
        // Ensure no division by zero and only integer results
        correctAnswer = (b != 0 && a % b == 0) ? a ~/ b : -1;
        break;
      default:
        correctAnswer = 0;
    }

    if (correctAnswer == int.parse(userAnswer)) {
      showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Hurry! You got it',
            onTap: goToNextQuestion,
            icon: Icons.arrow_forward,
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Sorry! Try Again',
            onTap: goBackToQuestion,
            icon: Icons.rotate_left,
          );
        },
      );
    }
  }

  void goToNextQuestion() {
    Navigator.of(context).pop();

    setState(() {
      userAnswer = '';
      // Create a new question
      a = randomNumber.nextInt(10);
      b = randomNumber.nextInt(10);

      // Randomly select an operation
      List<String> operations = ['+', '-', '×', '÷'];
      operation = operations[randomNumber.nextInt(operations.length)];

      // Ensure valid division question
      if (operation == '÷') {
        while (b == 0 || a % b != 0) {
          a = randomNumber.nextInt(10);
          b = randomNumber.nextInt(10);
        }
      }
    });
  }

  void goBackToQuestion() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: Column(
        children: [
          // TODO: level progress, player needs 5 correct answers in a row to get to the next level
          Container(
            height: 160,
            color: Colors.deepPurple,
          ),
          // Question
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$a $operation $b = ',
                      style: whiteTextStyle,
                    ),
                    // Answer box
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade400,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: whiteTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Number pad
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: numpad.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyButton(
                    child: numpad[index],
                    onTap: () => buttonTapped(numpad[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
