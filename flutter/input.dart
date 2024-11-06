import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo with Input'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _displayText = ''; // Variable to display entered values

  void _showValues() {
    setState(() {
      // Set _displayText to the combined text from both controllers
      _displayText =
          'Value 1: ${_controller1.text}, Value 2: ${_controller2.text}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(
                labelText: 'Enter first value',
              ),
            ),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(
                labelText: 'Enter second value',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showValues,
              child: const Text('Get Values'),
            ),
            const SizedBox(height: 20),
            Text(
              _displayText, // Display the entered values here
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
