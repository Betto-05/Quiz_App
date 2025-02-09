import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz_screen.dart';

class ExamPrepartionScreen extends StatelessWidget {
  const ExamPrepartionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.11,
            ),
            Center(
              child: Text(
                "Get Ready",
                style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Text(
              "Quiz Title :",
              style: TextStyle(
                  color: Colors.blue.shade900, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.027,
            ),
            Text.rich(
              TextSpan(
                  text: "Number of Questions : ",
                  style: TextStyle(
                      color: Colors.blue.shade900, fontWeight: FontWeight.bold),
                  children: const [
                    TextSpan(
                      style: TextStyle(color: Colors.blueGrey),
                      text: "10",
                    )
                  ]),
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.027,
            ),
            Text.rich(
              TextSpan(
                  text: "Time Limit : ",
                  style: TextStyle(
                      color: Colors.blue.shade900, fontWeight: FontWeight.bold),
                  children: const [
                    TextSpan(
                      style: TextStyle(color: Colors.blueGrey),
                      text: "300s",
                    )
                  ]),
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.027,
            ),
            Text.rich(
              TextSpan(
                  text: "Difficulty Level : ",
                  style: TextStyle(
                      color: Colors.blue.shade900, fontWeight: FontWeight.bold),
                  children: const [
                    TextSpan(
                      style: TextStyle(color: Colors.blueGrey),
                      text: "Normal",
                    )
                  ]),
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.027,
            ),
            Text.rich(
              TextSpan(
                  text: "Quiz Result : ",
                  style: TextStyle(
                      color: Colors.blue.shade900, fontWeight: FontWeight.bold),
                  children: const [
                    TextSpan(
                      style: TextStyle(color: Colors.blueGrey),
                      text:
                          "Each correct answer is worth 1 point. You’ll receive a score at the end of the quiz.",
                    )
                  ]),
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.027,
            ),
            Text.rich(
              TextSpan(
                  text: "Quiz feedback : ",
                  style: TextStyle(
                      color: Colors.blue.shade900, fontWeight: FontWeight.bold),
                  children: const [
                    TextSpan(
                      style: TextStyle(color: Colors.blueGrey),
                      text:
                          "We'll provide feedback after the quiz to help both you and us improve, ensuring everything is clear and accurate.",
                    )
                  ]),
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            MaterialButton(
                height: MediaQuery.of(context).size.height * 0.07,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                color: Colors.blue.shade900,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(),
                      ));
                },
                child: const Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )),
            const SizedBox(
              height: 16,
            ),
            MaterialButton(
                height: 50,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue.shade900),
                    borderRadius: BorderRadius.circular(16)),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.blue.shade900, fontSize: 16),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
