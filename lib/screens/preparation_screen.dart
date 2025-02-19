import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/Components/buttons.dart';
import 'package:quiz/cubit/cubit/challenges_cubit.dart';
import 'package:quiz/screens/quiz_screen.dart';

class ChallengePreparationScreen extends StatelessWidget {
  const ChallengePreparationScreen({super.key, required this.challenge});

  final String challenge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChallengePreparationBody(challenge: challenge),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            MaterialButton(
                height: MediaQuery.of(context).size.height * 0.07,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                color: Colors.blue.shade900,
                onPressed: () async {
                  challenge == 'Mix Quiz'
                      ? context
                          .read<ChallengesCubit>()
                          .generateQuestionWithItsOptionsForCognifyTestAndMixQuiz(
                              questionsNumber: 10)
                      : context
                          .read<ChallengesCubit>()
                          .generateQuestionWithItsOptions();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChallengeScreen(
                                challengeName: challenge,
                              )));
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
            cancelButton(context)
          ],
        ),
      ),
    );
  }
}

class ChallengePreparationBody extends StatelessWidget {
  const ChallengePreparationBody({super.key, required this.challenge});

  final String challenge;

  @override
  Widget build(BuildContext context) {
    return challenge == 'Mix Quiz'
        ? PreparationBody(
            challenge: challenge,
            numberOfQuestions: "10",
            challengeDescription:
                "Answering 10 questions from different subjects, 30sec for every question",
            timeLimit: "300sec")
        : challenge == 'Sudden Death'
            ? PreparationBody(
                challenge: challenge,
                numberOfQuestions: "Unlimited",
                challengeDescription:
                    "Answering questions from different subjects as possible as you can\n1 Mistake = The End",
                timeLimit: "Unlimited")
            : challenge == 'Cognify Test'
                ? PreparationBody(
                    challenge: challenge,
                    numberOfQuestions: "Unlimited",
                    challengeDescription:
                        "You have to answer 50 Questions from different subjects as possible as you can",
                    timeLimit: "15 Min")
                : challenge == 'Time Attack Mode'
                    ? PreparationBody(
                        challenge: challenge,
                        numberOfQuestions: "Unlimited",
                        challengeDescription:
                            "Answering questions from different subjects as fast as you can\n60 seconds = The End",
                        timeLimit: "60sec")
                    : PreparationBody(
                        challenge: challenge,
                        numberOfQuestions: "10",
                        challengeDescription:
                            "Answering 10 Questions in the $challenge within a time limit",
                        timeLimit: "300 sec");
  }
}

class PreparationBody extends StatelessWidget {
  const PreparationBody(
      {super.key,
      required this.challenge,
      required this.numberOfQuestions,
      required this.challengeDescription,
      required this.timeLimit});

  final String challenge;
  final String numberOfQuestions;
  final String timeLimit;
  final String challengeDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
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
          height: MediaQuery.of(context).size.height * 0.065,
        ),
        Text.rich(
          TextSpan(
              text: "Challenge Title : ",
              style: TextStyle(
                  color: Colors.blue.shade900, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    style: const TextStyle(color: Colors.blueGrey),
                    text: challenge)
              ]),
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
              children: [
                TextSpan(
                  style: const TextStyle(color: Colors.blueGrey),
                  text: numberOfQuestions,
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
              children: [
                TextSpan(
                    style: const TextStyle(color: Colors.blueGrey),
                    text: timeLimit)
              ]),
        ),
        const Divider(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.027,
        ),
        Text.rich(TextSpan(
            text: "Challenge Description : ",
            style: TextStyle(
                color: Colors.blue.shade900, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  style: const TextStyle(color: Colors.blueGrey),
                  text: challengeDescription)
            ])),
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
      ],
    );
  }
}
