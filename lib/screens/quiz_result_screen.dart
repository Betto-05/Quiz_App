import 'package:flutter/material.dart';
import 'package:quiz/Components/buttons.dart';

class ChallengeResultScreen extends StatelessWidget {
  const ChallengeResultScreen({
    super.key,
    required this.score,
  });
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ScoreBody(
                score: "$score",
                text1: score > 0 ? "Good job" : "Hard Luck",
                text2: "Next Time Do Better",
                color: score > 0
                    ? const Color.fromARGB(255, 37, 134, 214)
                    : Colors.redAccent),
          ),
        ),
      ),
    );
  }
}

class ScoreBody extends StatelessWidget {
  const ScoreBody(
      {super.key,
      required this.text1,
      required this.text2,
      required this.score,
      required this.color});

  final String text1;
  final String text2;
  final String score;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        CircleAvatar(
          maxRadius: 100,
          backgroundColor: color,
          child: CircleAvatar(
            maxRadius: 88,
            backgroundColor: const Color(0xff0F469A),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your Score",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(score,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    )),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(text1,
            style: const TextStyle(
              color: Color(0xff0F469A),
              fontSize: 24,
            )),
        Text(
          text2,
          style: const TextStyle(
            color: Color(0xff0F469A),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 120,
        ),
        ProvideFeedbackButton(userName: ""),
        const SizedBox(
          height: 25,
        ),
        const BackToHomeButton(),
      ],
    );
  }
}
