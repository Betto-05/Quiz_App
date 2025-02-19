import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/Components/profile_screen_component.dart';
import 'package:quiz/cubit/cubit/fecth_user_data_cubit.dart';
import 'package:quiz/screens/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ));
        return true;
      },
      child: BlocBuilder<FecthUserDataCubit, FecthUserDataState>(
          builder: (context, state) {
        if (state is FecthUserDataSuccessful) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ));
                    },
                    icon: const Icon(Icons.arrow_back)),
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.blue.shade900,
              ),
              body: Column(
                children: [
                  const ProfileScreenCover(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.032,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.42,
                      ),
                      Text(
                        state.userName.toUpperCase().substring(0, 1) +
                            state.userName.substring(1),
                        style: TextStyle(
                            fontSize: state.userName.length >= 15
                                ? MediaQuery.of(context).size.height * 0.02
                                : MediaQuery.of(context).size.height * 0.028,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  TabBar(
                    labelColor: Colors.blue.shade900,
                    indicatorColor: Colors.blue.shade900,
                    tabs: const [
                      Tab(text: ("Statistics"), icon: Icon(Icons.bar_chart)),
                      Tab(text: "Settings", icon: Icon(Icons.settings)),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        StatisticsBody(
                          state: state,
                        ),
                        SettingsBody(
                          userName: state.userName,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }),
    );
  }
}
