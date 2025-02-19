import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/Components/subject_card.dart';
import 'package:quiz/cubit/cubit/fetch_subject_cubit.dart';
import 'package:quiz/screens/subjects_screen.dart';

class SubjectsListViewBuilder extends StatelessWidget {
  const SubjectsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subjects",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.022),
            ),
            GestureDetector(
              onTap: () {
                context.read<FetchSubjectCubit>().getSubjects();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SubjectsScreen()));
              },
              child: Text(
                "See More >",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                    color: Colors.blue.shade900),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.017,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.110,
          child: BlocBuilder<FetchSubjectCubit, FetchSubjectState>(
            builder: (context, state) {
              if (state is FetchSubjectSuccessful) {
                return ListView.builder(
                  itemCount: state.subjectCounter,
                  itemBuilder: (context, index) {
                    return SubjectCard(
                        image: MemoryImage(
                            state.subjectImages[index]!), // ✅ Correct type

                        subject: state.subjectNames[index]);
                  },
                  scrollDirection: Axis.horizontal,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
