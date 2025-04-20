import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../add_tasks.dart';

class DailyPlannerPage extends StatefulWidget {
  const DailyPlannerPage({super.key});

  @override
  State<DailyPlannerPage> createState() => _DailyPlannerPageState();
}

class TaskItem {
  final String title;
  final DateTime dateTime;

  TaskItem({required this.title, required this.dateTime});
}

final List<TaskItem> tasks = [
  TaskItem(
      title: "Take medicine at 10 AM", dateTime: DateTime(2025, 4, 19, 10, 0)),
  TaskItem(title: "Walk for 1 hour", dateTime: DateTime(2025, 4, 19, 7, 30)),
  TaskItem(title: "Swim for 30 mins", dateTime: DateTime(2025, 4, 19, 16, 0)),
  TaskItem(
      title: "Bicycle ride for 15 mins",
      dateTime: DateTime(2025, 4, 19, 18, 0)),
  TaskItem(title: "Reach 10,000 steps", dateTime: DateTime(2025, 4, 19, 20, 0)),
];

class _DailyPlannerPageState extends State<DailyPlannerPage> {
  List<bool> taskStatus = [false, false, false, false, false];

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
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 190, 30, 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gradient Title at top
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color(0xFF3929C7),
                          Color(0xFFFA457E),
                          Color(0xFF7B49FF),
                        ],
                      ).createShader(bounds),
                      child: Text(
                        "Today’s Task",
                        style: GoogleFonts.lato(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // All Tasks
                    for (int i = 0; i < tasks.length; i++) ...[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            taskStatus[i] = !taskStatus[i];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF3929C7),
                                    width: 2,
                                  ),
                                  color: taskStatus[i]
                                      ? const Color(0xFF3929C7)
                                      : Colors.transparent,
                                ),
                                child: taskStatus[i]
                                    ? const Icon(Icons.check,
                                        size: 18, color: Colors.white)
                                    : null,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tasks[i].title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "${tasks[i].dateTime.day}/${tasks[i].dateTime.month}/${tasks[i].dateTime.year} "
                                      "${tasks[i].dateTime.hour.toString().padLeft(2, '0')}:${tasks[i].dateTime.minute.toString().padLeft(2, '0')}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 40),

                    // Add Task with arrow
                    GestureDetector(
                      onTap: () {
                        // Navigate to Add Task page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddTaskPage()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [
                                Color(0xFF3929C7),
                                Color(0xFFFA457E),
                                Color(0xFF7B49FF),
                              ],
                            ).createShader(bounds),
                            child: Text(
                              "Add More Task",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFF977D6),
                                  Color(0xFF623AA2),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom curve
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
        ],
      ),
    );
  }
}
