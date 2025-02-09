import 'package:flutter/material.dart';

class MixQuizCard extends StatelessWidget {
  const MixQuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 7,
                offset: const Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
                image: AssetImage("assets/main_screen_image.png"),
                fit: BoxFit.cover)),
        height: 145,
        width: 328,
      ),
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                  image: AssetImage("assets/Rectangle 2.png"),
                  fit: BoxFit.cover)),
          height: 145,
          width: 328),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Test Your Knowledge With\nCognify Test",
              style:
                  TextStyle(color: Colors.white, fontFamily: 'PlayfairDisplay'),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Take the exam and earn the prestigious trophy of excellence\nfor your exceptional knowledge and skills!",
              style: TextStyle(
                fontSize: 6,
                color: Colors.white,
                fontFamily: 'PlayfairDisplay',
              ),
            ),
            const SizedBox(height: 9),
            SizedBox(
              height: 30,
              width: 80,
              child: MaterialButton(
                height: 30,
                minWidth: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                color: Colors.white,
                onPressed: () {},
                child: Text(
                  "Start Now",
                  style: TextStyle(
                      fontSize: 9,
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      )
    ]);
  }
}

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key, required this.text, required this.onPressed});

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
