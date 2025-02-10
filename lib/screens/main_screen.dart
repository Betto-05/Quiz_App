import 'package:flutter/material.dart';
import 'package:quiz/Components/mix_quiz_card.dart';
import 'package:quiz/Components/subject_card.dart';
import 'package:quiz/screens/exam_prepartion_screen.dart';
import 'package:quiz/screens/profile_screen.dart';
import 'package:quiz/screens/subjects_screen.dart';
import 'package:quiz/services/database_services.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hello, ",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ));
                    },
                    child: const Icon(
                      Icons.person,
                      size: 32,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const MixQuizCard(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Subjects",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SubjectsScreen()));
                    },
                    child: Text(
                      "See More >",
                      style:
                          TextStyle(fontSize: 16, color: Colors.blue.shade900),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 85,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    SubjectCard(image: "REQ", subject: "Software Testing"),
                    SubjectCard(image: "REQ", subject: "Software Testing"),
                    SubjectCard(image: "REQ", subject: "Software Testing"),
                    SubjectCard(image: "REQ", subject: "Software Testing"),
                    SubjectCard(image: "REQ", subject: "Software Testing"),
                    SubjectCard(image: "REQ", subject: "Software Testing"),
                    SubjectCard(image: "REQ", subject: "Software Testing"),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Daily Quizes",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          icon: Icon(Icons.timer,
                              size: 120, color: Colors.blue.shade900),
                          title: const Text(
                            "These are daily quizes generated randomly\nthey are accessible once in a day",
                            style: TextStyle(fontSize: 11),
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
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Icon(
                      Icons.info,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.quiz,
                        color: Colors.blue.shade900,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Human and Computer Interaction",
                            style: TextStyle(fontSize: 11),
                          ),
                          Text(
                            "30 Questions",
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "Join",
                        style: TextStyle(
                            fontSize: 12, color: Colors.blue.shade900),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.quiz,
                        color: Colors.blue.shade900,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Human and Computer Interaction",
                            style: TextStyle(fontSize: 11),
                          ),
                          Text(
                            "30 Questions",
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "Join",
                        style: TextStyle(
                            fontSize: 12, color: Colors.blue.shade900),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.quiz,
                        color: Colors.blue.shade900,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Human and Computer Interaction",
                            style: TextStyle(fontSize: 11),
                          ),
                          Text(
                            "30 Questions",
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "Join",
                        style: TextStyle(
                            fontSize: 12, color: Colors.blue.shade900),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
