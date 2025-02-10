import 'package:flutter/material.dart';
import 'package:quiz/Components/subject_card.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Subjects"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 1.8,
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 4),
          children: const [
            SubjectCard(
              subject: "Human and Computer Interaction",
              image: "HCI",
            ),
            SubjectCard(
              subject: "Computer Architecutre",
              image: "CA",
            ),
            SubjectCard(
              subject: "Software Requirement",
              image: "REQ",
            ),
            SubjectCard(
              subject: "Software Testing",
              image: "Testing",
            ),
            SubjectCard(
              subject: "Software Requirement",
              image: "REQ",
            ),
            SubjectCard(
              subject: "Human and Computer Interaction",
              image: "HCI",
            ),
            SubjectCard(
              subject: "Computer Architecutre",
              image: "CA",
            ),
            SubjectCard(
              subject: "Software Requirement",
              image: "REQ",
            ),
            SubjectCard(
              subject: "Software Testing",
              image: "Testing",
            ),
            SubjectCard(
              subject: "Software Requirement",
              image: "REQ",
            ),
            SubjectCard(
              subject: "Human and Computer Interaction",
              image: "HCI",
            ),
            SubjectCard(
              subject: "Computer Architecutre",
              image: "CA",
            ),
            SubjectCard(
              subject: "Software Requirement",
              image: "REQ",
            ),
            SubjectCard(
              subject: "Software Testing",
              image: "Testing",
            ),
            SubjectCard(
              subject: "Software Requirement",
              image: "REQ",
            ),
            SubjectCard(
              subject: "Human and Computer Interaction",
              image: "HCI",
            ),
            SubjectCard(
              subject: "Computer Architecutre",
              image: "CA",
            ),
            SubjectCard(
              subject: "Software Requirement",
              image: "REQ",
            ),
            SubjectCard(
              subject: "Software Testing",
              image: "Testing",
            ),
            SubjectCard(
              subject: "Software Requirement",
              image: "REQ",
            ),
            SubjectCard(
              subject: "Human and Computer Interaction",
              image: "HCI",
            ),
            SubjectCard(
              subject: "Computer Architecutre",
              image: "CA",
            ),
            SubjectCard(
              subject: "Software Requirement",
              image: "REQ",
            ),
            SubjectCard(
              subject: "Software Testing",
              image: "Testing",
            ),
            SubjectCard(
              subject: "Software Requirement",
              image: "REQ",
            ),
            SubjectCard(
              subject: "Human and Computer Interaction",
              image: "HCI",
            ),
            SubjectCard(
              subject: "Computer Architecutre",
              image: "CA",
            ),
            SubjectCard(
              subject: "Software Requirement",
              image: "REQ",
            ),
            SubjectCard(
              subject: "Software Testing",
              image: "Testing",
            ),
            SubjectCard(
              subject: "Software Requirement",
              image: "REQ",
            )
          ],
        ),
      ),
    );
  }
}
