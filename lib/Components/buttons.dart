import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/Components/feedback_feature.dart';
import 'package:quiz/cubit/cubit/challenges_cubit.dart';

import 'package:quiz/screens/home_screen.dart';
import 'package:quiz/services/database_services.dart';

MaterialButton cancelButton(BuildContext context) {
  return MaterialButton(
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
      ));
}

class OptionButton extends StatelessWidget {
  const OptionButton(
      {super.key, required this.option, required this.onPressed});

  final String option;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: MaterialButton(
          height: 40,
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          highlightColor: Colors.blue.shade900,
          onPressed: onPressed,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              option,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ));
  }
}

class ProvideFeedbackButton extends StatelessWidget {
  const ProvideFeedbackButton({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: MediaQuery.of(context).size.height * 0.07,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.blue.shade900)),
        color: Colors.white,
        onPressed: () {
          feedbackfeature(
            context,
          );
        },
        child: Center(
          child: Text(
            "Provide a Feedback",
            style: TextStyle(color: Colors.blue.shade900, fontSize: 16),
          ),
        ));
  }
}

class BackToHomeButton extends StatelessWidget {
  const BackToHomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: MediaQuery.of(context).size.height * 0.07,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.blue.shade900,
        onPressed: () async {
          DatabaseServices().updateQuizTakenScore();
          context.read<ChallengesCubit>().reset();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ));
        },
        child: const Center(
          child: Text(
            "Back to Home",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ));
  }
}
