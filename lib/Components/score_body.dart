import 'package:flutter/material.dart';
import 'package:quiz/Components/buttons.dart';

class NormalQuizScoreBody extends StatelessWidget {
  const NormalQuizScoreBody(
      {super.key,
      required this.text1,
      required this.text2,
      required this.color});

  final String text1;
  final String text2;
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
          child: const CircleAvatar(
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
                Text("65 / 10",
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
        const ProvideFeedbackButton(),
        const SizedBox(
          height: 25,
        ),
        const BackToHomeButton(),
      ],
    );
  }
}
