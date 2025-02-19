import 'package:flutter/material.dart';
import 'package:quiz/screens/preparation_screen.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key, required this.image, required this.subject});

  final ImageProvider<Object> image;
  final String subject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChallengePreparationScreen(
              challenge: subject,
            ),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.65), BlendMode.srcATop),
                  image: image,
                  fit: BoxFit.cover)),
          width: 140,
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              subject,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
