import 'package:flutter/material.dart';
import 'package:quiz/screens/introduction_screen.dart';
import 'package:quiz/services/database_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseServices().database;

  runApp(const Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Kufam'),
      home: IntroductionScreenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
