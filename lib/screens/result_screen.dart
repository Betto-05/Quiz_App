import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              maxRadius: 100,
              backgroundColor: Color(0xff407DD8),
              child: CircleAvatar(
                maxRadius: 88,
                backgroundColor: Color(0xff0F469A),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your Score",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text("8 / 10",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Congratulation",
                style: TextStyle(
                  color: Color(0xff0F469A),
                  fontSize: 24,
                )),
            const Text(
              "Great job, Ibrahim! You Did It",
              style: TextStyle(
                color: Color(0xff0F469A),
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xff0F469A),
              ),
              height: 47,
              child: const Center(
                child: Text(
                  "Share",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xff0F469A),
              ),
              height: 47,
              child: const Center(
                child: Text(
                  "Back to Home",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
