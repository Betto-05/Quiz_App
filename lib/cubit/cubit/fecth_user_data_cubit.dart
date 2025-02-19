import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:quiz/services/database_services.dart';

part 'fecth_user_data_state.dart';

class FecthUserDataCubit extends Cubit<FecthUserDataState> {
  FecthUserDataCubit() : super(FecthUserDataInitial());

  late String quizTakenScore;
  late String questionAnsweredScore;
  late String correctAnswersScore;
  late String skippedQuestions;
  late String survivalStreak;
  late String timeAttackScore;
  late String userName;
  late String cognifyTestWinner;

  void getData() async {
    emit(FecthUserDataLoading());

    try {
      quizTakenScore = await DatabaseServices().getQuizTakenScore();
      questionAnsweredScore =
          await DatabaseServices().getQuestionAnsweredScore();
      correctAnswersScore = await DatabaseServices().getCorrectAnswersScore();
      skippedQuestions = await DatabaseServices().getSkippedQuestions();
      survivalStreak = await DatabaseServices().getSurvivalStreak();
      timeAttackScore = await DatabaseServices().getTimeAttackScore();
      userName = await DatabaseServices().getUsername();
      cognifyTestWinner = await DatabaseServices().getCognifyTestWinner();
      emit(FecthUserDataSuccessful(
          timeAttackScore: timeAttackScore,
          cognifyTestWinner: cognifyTestWinner,
          survivalStreak: survivalStreak,
          skippedQuestions: skippedQuestions,
          userName: userName,
          quizTakenScore: quizTakenScore,
          correctAnswerScore: correctAnswersScore,
          questionAnsweredScore: questionAnsweredScore));
    } catch (e) {
      emit(FecthUserDataFailure());
    }
  }

  void updateUserName(String userName) async {
    try {
      DatabaseServices().updateUserName(userName);
    } catch (e) {
      emit(FecthUserDataFailure());
    }
  }

  Future<String> getUsername() async {
    emit(FecthUserDataLoading());

    try {
      userName = await DatabaseServices().getUsername();
      emit(FetchOnlyUserNameSuccessfully(userName: userName));
    } catch (e) {
      emit(FecthUserDataFailure());
    }
    return "";
  }

  Future<String> getCognifyTestWinner() async {
    emit(FecthUserDataLoading());

    try {
      cognifyTestWinner = await DatabaseServices().getCognifyTestWinner();

      if (cognifyTestWinner == '1') {
        emit(FetchOnlyCognifyTestSuccessfully(
            cognifyTestWinner: cognifyTestWinner));
      }
    } catch (e) {
      emit(FecthUserDataFailure());
    }
    return "";
  }
}
