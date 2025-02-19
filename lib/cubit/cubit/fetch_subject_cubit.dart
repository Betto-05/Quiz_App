import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz/services/database_services.dart';

part 'fetch_subject_state.dart';

class FetchSubjectCubit extends Cubit<FetchSubjectState> {
  FetchSubjectCubit() : super(FetchSubjectInitialState());

  int? subjectCounter;
  List<String>? subjectNames;
  List<Uint8List?>? subjectImages;
  List? dailyQuizes;
  void getSubjects() async {
    try {
      subjectImages = await DatabaseServices().getImage();
      subjectCounter = await DatabaseServices().getRowCount();
      subjectNames = await DatabaseServices().getSubjectName();

      dailyQuizes = await DatabaseServices().getRandomDailyQuizes();

      emit(FetchSubjectSuccessful(
          dailyQuizes: dailyQuizes!,
          subjectCounter: subjectCounter!,
          subjectNames: subjectNames!,
          subjectImages: subjectImages!));
    } catch (e) {
      emit(FetchSubjectFailure());
    }
  }
}
