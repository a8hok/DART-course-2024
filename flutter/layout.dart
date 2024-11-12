import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.green[100],
          appBar: AppBar(
            backgroundColor: Colors.green[200],
            title: const Text(
              'Math with me!',
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            leading: Icon(Icons.menu),
            actions: [
              IconButton(
                icon: const Icon(Icons.login),
                tooltip: 'Login',
                onPressed: () {},
              )
            ],
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // children: const [
            //   // Text(
            //   //   'Hello World!',
            //   //   style: TextStyle(
            //   //     color: Colors.black,
            //   //     fontSize: 25,
            //   //   ),
            //   // ),
            //   TextField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       hintText: 'Enter a search term',
            //     ),
            //   )
            // ],
            children: <Widget>[
              Text(
                'Sign In!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter first value',
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter second value',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Get Values'),
              ),
              const SizedBox(height: 20),
            ],
          )),
        ));
  }
}
