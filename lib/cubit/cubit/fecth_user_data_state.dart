part of 'fecth_user_data_cubit.dart';

@immutable
sealed class FecthUserDataState {}

final class FecthUserDataInitial extends FecthUserDataState {}

final class FecthUserDataSuccessful extends FecthUserDataState {
  final String correctAnswerScore;
  final String quizTakenScore;
  final String questionAnsweredScore;
  final String skippedQuestions;
  final String survivalStreak;
  final String timeAttackScore;
  final String userName;
  final String cognifyTestWinner;

  FecthUserDataSuccessful(
      {required this.questionAnsweredScore,
      required this.correctAnswerScore,
      required this.skippedQuestions,
      required this.cognifyTestWinner,
      required this.timeAttackScore,
      required this.survivalStreak,
      required this.userName,
      required this.quizTakenScore});
}

final class FecthUserDataLoading extends FecthUserDataState {}

final class FecthUserDataFailure extends FecthUserDataState {}

final class FetchOnlyUserNameSuccessfully extends FecthUserDataState {
  final String userName;

  FetchOnlyUserNameSuccessfully({required this.userName});
}

final class FetchOnlyCognifyTestSuccessfully extends FecthUserDataState {
  final String cognifyTestWinner;

  FetchOnlyCognifyTestSuccessfully({required this.cognifyTestWinner});
}
