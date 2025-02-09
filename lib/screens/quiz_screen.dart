import 'package:flutter/material.dart';
import 'package:flutter_animated_timer_icon/flutter_animated_timer_icon.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});

  final animateTimerController = AnimateTimerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Software Engineering",
          style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Question : 1/10",
                            style: TextStyle(
                                fontSize: 10, color: Color(0xff0F469A)),
                          ),
                          AnimateTimer(
                              animationBehaviorPreserve: true,
                              animationDuration: 30,
                              animateTimerController: animateTimerController)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "What is SDLC stands for",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OptionButton(
                        color: const Color(0xff0F469A),
                        textColor: Colors.white,
                      ),
                      OptionButton(),
                      OptionButton(),
                      OptionButton(),
                    ],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 15,
                ),
                SwitchQuestionButton(
                  text: "Next",
                  onPressed: () {
                    animateTimerController.restart();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SwitchQuestionButton extends StatelessWidget {
  const SwitchQuestionButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Colors.blue.shade900,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  OptionButton({super.key, this.color, this.textColor});

  Color? color;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Devolpment",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 12, color: textColor),
                )),
          ),
        ),
      ),
    );
  }
}
