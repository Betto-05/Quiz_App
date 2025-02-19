import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/Components/subject_card.dart';

import 'package:quiz/cubit/cubit/fetch_subject_cubit.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: true,
        centerTitle: true,
        title: const Text("Subjects"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<FetchSubjectCubit, FetchSubjectState>(
            builder: (context, state) {
          if (state is FetchSubjectSuccessful) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 1.8,
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 4),
              itemCount: state.subjectCounter,
              itemBuilder: (context, index) {
                return SubjectCard(
                  subject: state.subjectNames[index],
                  image: MemoryImage(
                      state.subjectImages[index]!), // ✅ Correct type
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        }),
      ),
    );
  }
}
