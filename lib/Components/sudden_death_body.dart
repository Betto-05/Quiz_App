import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/Components/buttons.dart';
import 'package:quiz/cubit/cubit/challenges_cubit.dart';
import 'package:quiz/screens/quiz_result_screen.dart';

class SuddenDeathBody extends StatelessWidget {
  const SuddenDeathBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        const Text(
          "Sudden Death",
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        BlocBuilder<ChallengesCubit, ChallengesState>(
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
                        const SizedBox(height: 20),
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
                                          context
                                              .read<ChallengesCubit>()
                                              .generateQuestionWithItsOptions();
                                        } else {
                                          context
                                              .read<ChallengesCubit>()
                                              .updateSurvivalScore(context
                                                  .read<ChallengesCubit>()
                                                  .score);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ChallengeResultScreen(
                                                  score: context
                                                      .read<ChallengesCubit>()
                                                      .score,
                                                ),
                                              ));
                                        }
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
