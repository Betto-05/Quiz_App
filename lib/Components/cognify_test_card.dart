import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/cubit/cubit/fecth_user_data_cubit.dart';
import 'package:quiz/screens/preparation_screen.dart';

class CognifyTestCard extends StatelessWidget {
  const CognifyTestCard({super.key});

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
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.height * 0.5,
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
                image: AssetImage("assets/Rectangle 2.png"),
                fit: BoxFit.cover)),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.height * 0.5,
      ),
      Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Test Your Knowledge With\nCognify Test",
              style:
                  TextStyle(color: Colors.white, fontFamily: 'PlayfairDisplay'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0065,
            ),
            Text(
              "Take the exam and earn the prestigious trophy of excellence\nfor your exceptional knowledge and skills!",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.008,
                color: Colors.white,
                fontFamily: 'PlayfairDisplay',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0125,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.042,
              width: MediaQuery.of(context).size.height * 0.12,
              child: BlocProvider(
                create: (context) =>
                    FecthUserDataCubit()..getCognifyTestWinner(),
                child: BlocBuilder<FecthUserDataCubit, FecthUserDataState>(
                  builder: (context, state) {
                    if (state is FetchOnlyCognifyTestSuccessfully) {
                      return MaterialButton(
                        height: MediaQuery.of(context).size.height * 0.048,
                        minWidth: MediaQuery.of(context).size.height * 0.015,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: Colors.white,
                        onPressed: () {},
                        child: Text(
                          "Done",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0125,
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    } else {
                      return MaterialButton(
                        height: MediaQuery.of(context).size.height * 0.048,
                        minWidth: MediaQuery.of(context).size.height * 0.015,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const ChallengePreparationScreen(
                                    challenge: "Cognify Test",
                                  )));
                        },
                        child: Text(
                          "Start Now",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0125,
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                  },
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
