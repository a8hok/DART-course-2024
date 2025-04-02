import 'package:flutter/material.dart';

import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Lane',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Start with SplashScreen
    );
  }
}
