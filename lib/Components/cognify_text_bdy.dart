import 'package:flutter/material.dart';
import 'package:flutter_animated_timer_icon/flutter_animated_timer_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/Components/buttons.dart';
import 'package:quiz/cubit/cubit/challenges_cubit.dart';
import 'package:quiz/screens/quiz_result_screen.dart';

class CognifyTest extends StatelessWidget {
  CognifyTest({super.key});

  final AnimateTimerController animateTimerController =
      AnimateTimerController();

  @override
  Widget build(BuildContext context) {
    context.read<ChallengesCubit>().startCognifyTimer(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        const Text(
          "Cognify Test",
          style: TextStyle(fontSize: 30),
        ),
        Align(
          alignment: Alignment.center,
          child: AnimateTimer(
              animationBehaviorPreserve: true,
              animationDuration: 900,
              animateTimerController: animateTimerController),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        BlocConsumer<ChallengesCubit, ChallengesState>(
          listener: (context, state) {
            if (state is ChallengeEnd) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChallengeResultScreen(
                        score: context.read<ChallengesCubit>().score),
                  ));
            }
          },
          builder: (context, state) {
            if (state is NextQuestionSuccessful) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Text(state.question),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                            height: state.options.length == 4 ? 285 : 150,
                            child: ListView.builder(
                                itemCount: state.options.length,
                                itemBuilder: (context, index) {
                                  return OptionButton(
                                      onPressed: () {
                                        if (state.options[index]['IsCorrect'] ==
                                            1) {
                                          context
                                              .read<ChallengesCubit>()
                                              .incrementScore();
                                        }

                                        context
                                            .read<ChallengesCubit>()
                                            .incrementQuestionCounter();
                                        context
                                            .read<ChallengesCubit>()
                                            .generateQuestionWithItsOptionsForCognifyTestAndMixQuiz(
                                                questionsNumber: 50);
                                      },
                                      option:
                                          "${state.options[index]['OptionText']}");
                                })),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    );
  }
}
