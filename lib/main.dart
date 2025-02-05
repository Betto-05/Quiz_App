import 'package:flutter/material.dart';
import 'package:quiz/screens/main_screen.dart';

// Import ffi

void main()async {
  runApp(const Quiz());

}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}