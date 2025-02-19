import 'package:flutter/material.dart';
import 'package:quiz/cubit/cubit/challenges_cubit.dart';
import 'package:quiz/cubit/cubit/fecth_user_data_cubit.dart';
import 'package:quiz/cubit/cubit/fetch_subject_cubit.dart';
import 'package:quiz/cubit/cubit/theme_cubit.dart';
import 'package:quiz/screens/home_screen.dart';
import 'package:quiz/screens/introduction_screen.dart';
import 'package:quiz/services/database_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseServices().database;

  runApp(const Cognify());
}

class Cognify extends StatelessWidget {
  const Cognify({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchSubjectCubit()..getSubjects()),
        BlocProvider(create: (context) => ChallengesCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => FecthUserDataCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            darkTheme: ThemeData(
              primaryColor: Colors.black,
              brightness: Brightness.dark,
              fontFamily: 'Kufam',
              buttonTheme: const ButtonThemeData(),
            ),
            themeMode: state,
            theme: ThemeData(
              fontFamily: 'Kufam',
            ),
            home: FutureBuilder<bool>(
              future: DatabaseServices().isFirstTime(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                }

                if (snapshot.hasError || snapshot.data == null) {
                  return const Scaffold(
                    body: Center(child: Text("Error loading data")),
                  );
                }
                if (snapshot.data == true) {
                  return IntroductionScreenPage();
                } else {
                  return const MainScreen();
                }
              },
            ),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
