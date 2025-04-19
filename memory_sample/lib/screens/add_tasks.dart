import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller for the TextField
    TextEditingController taskController = TextEditingController();
    DateTime? selectedDateTime;

    // Gradient effect on the title
    const LinearGradient gradient = LinearGradient(
      colors: [Colors.purple, Colors.blue],
    );

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
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    // Gradient Text
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return gradient.createShader(bounds);
                      },
                      child: Text(
                        'Add Task!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Gradient will be applied here
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Text field for task input
                    _buildTextField('Enter a task', taskController),

                    const SizedBox(height: 20),

                    _buildDateTimePicker(context, selectedDateTime,
                        (newDateTime) {
                      selectedDateTime = newDateTime;
                    }),
                    const SizedBox(height: 20),

                    // Add Task Button
                    _AnimatedSendButton(
                      onPressed: () {
                        if (taskController.text.isNotEmpty) {
                          // Show success pop-up dialog
                          showGeneralDialog(
                            barrierDismissible: true,
                            barrierLabel: "Task Added",
                            context: context,
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            pageBuilder: (_, __, ___) => Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (bounds) =>
                                          const LinearGradient(
                                        colors: [
                                          Color(0xFF3929C7),
                                          Color(0xFFFA457E),
                                          Color(0xFF7B49FF),
                                        ],
                                      ).createShader(bounds),
                                      child: const Icon(
                                        Icons.check_circle,
                                        size: 60,
                                        color: Colors
                                            .white, // Important: use white to show gradient
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Task added successfully!',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration
                                            .none, // ⬅️ No underline
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            transitionBuilder: (_, anim, __, child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 1),
                                  end: Offset.zero,
                                ).animate(CurvedAnimation(
                                    parent: anim, curve: Curves.easeOut)),
                                child: FadeTransition(
                                  opacity: anim,
                                  child: child,
                                ),
                              );
                            },
                          );
                          taskController
                              .clear(); // Clear the text field after task is added
                        } else {
                          // If no task entered, show an error snack bar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please enter a task')),
                          );
                        }
                      },
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

  // TextField Widget similar to ForgotPasswordPage style
  Widget _buildTextField(String hint, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 151, 150, 150).withOpacity(0.9),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black26),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _AnimatedSendButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _AnimatedSendButton({required this.onPressed});

  @override
  State<_AnimatedSendButton> createState() => _AnimatedSendButtonState();
}

Widget _buildDateTimePicker(BuildContext context, DateTime? selectedDateTime,
    Function(DateTime) onDateTimeChanged) {
  return GestureDetector(
    onTap: () async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDateTime ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (pickedDate != null) {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime:
              TimeOfDay.fromDateTime(selectedDateTime ?? DateTime.now()),
        );

        if (pickedTime != null) {
          final DateTime fullDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          onDateTimeChanged(fullDateTime);
        }
      }
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 151, 150, 150).withOpacity(0.9),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, color: Colors.black45),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              selectedDateTime != null
                  ? "${selectedDateTime.day}/${selectedDateTime.month}/${selectedDateTime.year} ${selectedDateTime.hour.toString().padLeft(2, '0')}:${selectedDateTime.minute.toString().padLeft(2, '0')}"
                  : "Select date & time",
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    ),
  );
}

class _AnimatedSendButtonState extends State<_AnimatedSendButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.9;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
    Future.delayed(const Duration(milliseconds: 100), widget.onPressed);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () {
        setState(() {
          _scale = 1.0;
        });
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 150),
        child: Container(
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
      ),
    );
  }
}
