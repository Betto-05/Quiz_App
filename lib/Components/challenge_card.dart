import 'package:flutter/material.dart';
import 'package:quiz/screens/preparation_screen.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({super.key, required this.challengeName});

  final String challengeName;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            18,
          ),
          borderSide: BorderSide(color: Colors.blue.shade900)),
      elevation: 11,
      child: MaterialButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
          18,
        )),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ChallengePreparationScreen(challenge: challengeName),
          ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 30,
                child: Image.asset("assets/challenge_icon.png"),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    challengeName,
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
