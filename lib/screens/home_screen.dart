import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/Components/challenge_card.dart';
import 'package:quiz/Components/cognify_test_card.dart';
import 'package:quiz/Components/quit_game_function.dart';
import 'package:quiz/Components/subject_list_view_builder.dart';
import 'package:quiz/cubit/cubit/fecth_user_data_cubit.dart';
import 'package:quiz/cubit/cubit/fetch_subject_cubit.dart';
import 'package:quiz/screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        quitGame(context);
        return true;
      },
      child: Scaffold(
        body: BlocProvider(
          create: (context) => FecthUserDataCubit()..getUsername(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.025),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.070),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<FecthUserDataCubit, FecthUserDataState>(
                        builder: (context, state) {
                          if (state is FetchOnlyUserNameSuccessfully) {
                            return Text(
                              "Hello, ${state.userName.toUpperCase().substring(0, 1) + state.userName.substring(1)}",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<FecthUserDataCubit>().getData();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ));
                        },
                        child: Icon(
                          Icons.person,
                          size: MediaQuery.of(context).size.height * 0.047,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0255,
                  ),
                  const CognifyTestCard(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0255,
                  ),
                  BlocProvider(
                    create: (context) => FetchSubjectCubit()..getSubjects(),
                    child: const SubjectsListViewBuilder(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.045,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Challenges",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.013,
                  ),
                  const ChallengeCard(challengeName: "Sudden Death"),
                  const ChallengeCard(challengeName: "Time Attack Mode"),
                  const ChallengeCard(challengeName: "Mix Quiz"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  const Text(
                    "Powered By Ibrahim Elferjani",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
