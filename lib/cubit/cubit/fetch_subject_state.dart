part of 'fetch_subject_cubit.dart';

@immutable
sealed class FetchSubjectState {}

final class FetchSubjectInitialState extends FetchSubjectState {}

final class FetchSubjectSuccessful extends FetchSubjectState {
  final int subjectCounter;
  final List subjectNames;
  final List subjectImages;
  final List dailyQuizes;

  FetchSubjectSuccessful(
      {required this.subjectCounter,
      required this.subjectNames,
      required this.dailyQuizes,
      required this.subjectImages});
}

final class FetchSubjectFailure extends FetchSubjectState {}
