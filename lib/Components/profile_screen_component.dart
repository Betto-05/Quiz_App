import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:quiz/Components/edit_username_function.dart';
import 'package:quiz/cubit/cubit/fecth_user_data_cubit.dart';
import 'package:quiz/cubit/cubit/theme_cubit.dart';

// This is the grid view that shows the settings cards in the profile screen
class SettingsBody extends StatelessWidget {
  const SettingsBody({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        children: [
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: MediaQuery.of(context).size.height * 0.0021,
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8),
              children: [
                BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (context, state) {
                    return ProfileCards(
                      cardName:
                          state == ThemeMode.light ? "Dark Mode" : "Light Mode",
                      icon: state == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.sunny,
                      onTap: () {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    );
                  },
                ),
                ProfileCards(
                  cardName: "Edit Name",
                  icon: Icons.edit,
                  onTap: () => editUserNameFunction(context, userName),
                ),
                ProfileCards(
                  cardName: "Feedback",
                  icon: Icons.feedback,
                  onTap: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       actions: [
                    //         SizedBox(
                    //           height: MediaQuery.of(context).size.height * 0.02,
                    //         ),
                    //         TextField(
                    //           onChanged: (value) {
                    //             userName = value;
                    //           },
                    //           decoration: InputDecoration(
                    //             hintText: "Title",
                    //             hintStyle: const TextStyle(
                    //               fontSize: 12,
                    //             ),
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(16),
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: MediaQuery.of(context).size.height * 0.02,
                    //         ),
                    //         SizedBox(
                    //           height: 150,
                    //           child: TextField(
                    //               onChanged: (value) {
                    //                 userName = value;
                    //               },
                    //               decoration: InputDecoration(
                    //                 contentPadding: EdgeInsets.symmetric(
                    //                     vertical: 150, horizontal: 8),
                    //                 hintText: "Description",
                    //                 hintStyle: const TextStyle(fontSize: 12),
                    //                 border: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(16),
                    //                 ),
                    //               )),
                    //         ),
                    //         SizedBox(
                    //           height: 12,
                    //         ),
                    //         MaterialButton(
                    //           height: 45,
                    //           color: Colors.blue.shade900,
                    //           shape: OutlineInputBorder(
                    //               borderSide:
                    //                   BorderSide(color: Colors.transparent),
                    //               borderRadius: BorderRadius.circular(16)),
                    //           onPressed: () {},
                    //           child: Center(
                    //             child: Text(
                    //               "Submit",
                    //               style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.bold),
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 8,
                    //         ),
                    //         MaterialButton(
                    //           height: 45,
                    //           color: Colors.white,
                    //           shape: OutlineInputBorder(
                    //               borderSide:
                    //                   BorderSide(color: Colors.blue.shade900),
                    //               borderRadius: BorderRadius.circular(16)),
                    //           onPressed: () {},
                    //           child: Center(
                    //             child: Text(
                    //               "Cancel",
                    //               style: TextStyle(
                    //                   color: Colors.blue.shade900,
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.bold),
                    //             ),
                    //           ),
                    //         )
                    //       ],
                    //     );
                    //   },
                    // );
                  },
                ),
                ProfileCards(
                    cardName: "About",
                    icon: Icons.info_outline,
                    onTap: () => showAboutInfo(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// This is the grid view that shows the statistics cards in the profile screen
class StatisticsBody extends StatelessWidget {
  const StatisticsBody({super.key, required this.state});

  final FecthUserDataSuccessful state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.02,
        right: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.02,
        top: MediaQuery.of(context).size.height * 0.01,
      ),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: MediaQuery.of(context).size.height * 0.0021,
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8),
        children: [
          ProfileCards(
              flip: true,
              helpText:
                  "This card calculates the score of the normal quizes you took ",
              icon: Icons.quiz,
              score: state.quizTakenScore,
              cardName: "Quiz Taken"),
          ProfileCards(
              flip: true,
              helpText:
                  "This card calculates the score of the timed out Questions ",
              score: state.skippedQuestions,
              cardName: "Skipped Questions",
              icon: Icons.skip_next),
          ProfileCards(
              flip: true,
              helpText:
                  "This card calculates the score of questions you have answered in the normal quizes",
              score: state.questionAnsweredScore,
              cardName: "Question Answered",
              icon: Icons.question_answer),
          ProfileCards(
              flip: true,
              helpText:
                  "This card calculates the score of the correct answers you made ",
              score: state.correctAnswerScore,
              cardName: "Correct Answers",
              icon: Icons.verified),
          ProfileCards(
              flip: true,
              helpText:
                  "This card calculates the best streak score of the survival mode you made",
              score: state.survivalStreak,
              cardName: "Survival Streak",
              icon: Icons.verified),
          ProfileCards(
              flip: true,
              helpText:
                  "This card calculates the best score of correct answers in the Time Attack mode you made",
              score: state.timeAttackScore,
              cardName: "Time Attack Score",
              icon: Icons.verified),
        ],
      ),
    );
  }
}

// This Widget contains the cover photo and the name in the profile screen
class ProfileScreenCover extends StatelessWidget {
  const ProfileScreenCover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.19,
          color: Colors.blue.shade900,
          child: Center(
            child: Column(
              children: [
                Text(
                  "Cognify",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.042,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Your Learning, Your Way",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -MediaQuery.of(context).size.height * 0.105,
          left: MediaQuery.of(context).size.height * 0.013,
          child: CircleAvatar(
            backgroundColor: Colors.blue.shade900,
            radius: MediaQuery.of(context).size.height * 0.089,
          ),
        ),
        Positioned(
          bottom: -MediaQuery.of(context).size.height * 0.1,
          left: MediaQuery.of(context).size.height * 0.02,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: MediaQuery.of(context).size.height * 0.082,
            child: Icon(
              color: Colors.blue.shade900,
              Icons.person,
              size: MediaQuery.of(context).size.height * 0.125,
            ),
          ),
        ),
      ],
    );
  }
}

// this widget is the cards in blue that represented in the statistics and settings tap bar in the profile screen
class ProfileCards extends StatelessWidget {
  const ProfileCards(
      {super.key,
      this.score,
      required this.cardName,
      this.helpText,
      this.flip,
      this.onTap,
      required this.icon});

  final String? score;
  final String cardName;
  final String? helpText;
  final bool? flip;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FlipCard(
          backWidget: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue.shade900,
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  helpText ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
              ))),
          rotateSide: RotateSide.left,
          onTapFlipping: flip ?? false,
          animationDuration: const Duration(milliseconds: 500),
          controller: FlipCardController(),
          frontWidget: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue.shade900,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.height * 0.01),
                      child: Text(
                        score ?? "",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.height * 0.01),
                      child: Text(
                        cardName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}

// this function is to show the dialog of the " about " card in the profile screen
Future<dynamic> showAboutInfo(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Center(
          child: Text(
            "Cognify",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.043,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Version 1.0",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.0155,
                color: Colors.grey),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Cognify is a quiz app designed to test and enhance your knowledge in various IT subjects. Whether you're a student, a tech enthusiast, or preparing for exams, Cognify helps you sharpen your skills with interactive quizzes.",
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.016),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "• Covers multiple IT subjects\n• Interactive quizzes with detailed answers\n• Tracks your progress and performance\n• User-friendly interface",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.013,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Credits",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  color: Colors.blue.shade900),
            )),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Ibrahim Mohammed Elferjani\nEmail : Betoelferjani@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.012,
              ),
            )),
      ],
    ),
  );
}
