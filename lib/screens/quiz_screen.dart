import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/Components/cognify_text_bdy.dart';
import 'package:quiz/Components/mix_quiz_mode.dart';
import 'package:quiz/Components/normal_quiz_body.dart';
import 'package:quiz/Components/sudden_death_body.dart';
import 'package:quiz/Components/time_attack_mode_body.dart';
import 'package:quiz/cubit/cubit/challenges_cubit.dart';
import 'package:quiz/screens/home_screen.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({
    super.key,
    required this.challengeName,
  });

  final String challengeName;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          showDialog(
            context: context,
            builder: (context) => const LeavingChallengeDialog(),
          );

          return true;
        },
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  // onPressed: BackButtonChallenge(context),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const LeavingChallengeDialog(),
                    );
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: challengeName == 'Sudden Death'
                ? const SuddenDeathBody()
                : challengeName == 'Time Attack Mode'
                    ? TimeAttackMode()
                    : challengeName == 'Cognify Test'
                        ? CognifyTest()
                        : challengeName == 'Mix Quiz'
                            ? MixQuizMode()
                            : NormalQuiz(
                                quizTitle: challengeName,
                              )));
  }
}

class LeavingChallengeDialog extends StatelessWidget {
  const LeavingChallengeDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.warning, size: 120, color: Colors.red),
      title: const Text(
        "Are you sure you want to leave\nour current score won't be count",
        style: TextStyle(fontSize: 15),
      ),
      actions: [
        Center(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
              ),
              onPressed: () {
                context.read<ChallengesCubit>().stopTimeAttackModeTimer();
                context.read<ChallengesCubit>().reset();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ));
              },
              child: const Text("OK", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.blue.shade900),
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  Text("Cancel", style: TextStyle(color: Colors.blue.shade900)),
            ),
          ),
        ),
      ],
    );
  }
}
