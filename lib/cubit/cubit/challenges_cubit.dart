import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_timer_icon/flutter_animated_timer_icon.dart';
import 'package:quiz/screens/quiz_result_screen.dart';
import 'package:quiz/services/database_services.dart';

part 'challenges_state.dart';

class ChallengesCubit extends Cubit<ChallengesState> {
  ChallengesCubit() : super(ChallengesInitial());

  int score = 0;
  int questionsCounter = 0;

  Timer? _questionTimer;
  Timer? timeAttackModeTimer;

  Future<List> generateQuestionWithItsOptions() async {
    emit(NextQuestionLoading());

    try {
      final question =
          await DatabaseServices().getRandomQuestionsFromRandomSubjects();

      var questionId = question.first['QuestionID'];
      var subjectID = question.first['SubjectID'];
      final options = await DatabaseServices()
          .getRandomOptionsOfRandomQuestions(questionId, subjectID);

      List questionWithOptions = [
        {
          'QuestionText': question.first['QuestionText'].toString(),
          'Options': options,
        }
      ];
      emit(NextQuestionSuccessful(
          question: questionWithOptions.first['QuestionText'].toString(),
          options: options));
      return questionWithOptions;
    } catch (e) {
      emit(NextQuestionFailure());
      return [];
    }
  }

  void incrementScore() {
    score++;
  }

  void incrementQuestionCounter() {
    questionsCounter++;
  }

  void reset() {
    _questionTimer?.cancel();
    score = 0;
    questionsCounter = 0;
  }

  void updateSurvivalScore(int score) {
    DatabaseServices().updateSurvivalStreak(score);
  }

  void updateTimeAttackScore(int score) {
    DatabaseServices().updateTimeAttackScore(score);
  }

  void endTimeAttackMode(context) {
    timeAttackModeTimer?.cancel();
    timeAttackModeTimer = Timer(const Duration(seconds: 60), () {
      if (!context.mounted) return;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChallengeResultScreen(
              score: score,
            ),
          ));
    });

    DatabaseServices().updateTimeAttackScore(score);
  }

  void stopTimeAttackModeTimer() {
    timeAttackModeTimer?.cancel();
  }

  void questionTimedOut(context) async {
    _questionTimer?.cancel();

    if (questionsCounter <= 10) {
      _questionTimer = Timer(const Duration(seconds: 30), () {
        incrementQuestionCounter();
        generateQuestionWithItsOptions();
      });
    } else {
      _questionTimer?.cancel();
    }
  }

  void startTimerForMixQuizAndNormalQuiz(
      AnimateTimerController animateTimerController) {
    _questionTimer?.cancel();

    if (questionsCounter < 10) {
      _questionTimer = Timer(const Duration(seconds: 30), () {
        if (state is NextQuestionSuccessful) {
          animateTimerController.restart();
          incrementQuestionCounter();
          generateQuestionWithItsOptions();
        }
      });
    } else {
      _questionTimer?.cancel();
      animateTimerController.stop();
      emit(ChallengeEnd());
    }
  }

  void startCognifyTimer(context) {
    _questionTimer?.cancel();

    _questionTimer = Timer(const Duration(minutes: 15), () {
      emit(ChallengeEnd());
    });
  }

// This function works well for the Cognify Test and mix quiz challenge , because it's the same functionality , the difference is the number of question
  Future<List> generateQuestionWithItsOptionsForCognifyTestAndMixQuiz(
      {required int questionsNumber}) async {
    emit(NextQuestionLoading());

    if (questionsCounter < questionsNumber) {
      try {
        final question =
            await DatabaseServices().getRandomQuestionsFromRandomSubjects();

        var questionId = question.first['QuestionID'];
        var subjectID = question.first['SubjectID'];

        final options = await DatabaseServices()
            .getRandomOptionsOfRandomQuestions(questionId, subjectID);

        List questionWithOptions = [
          {
            'QuestionText': question.first['QuestionText'].toString(),
            'Options': options,
          }
        ];
        emit(NextQuestionSuccessful(
            question: questionWithOptions.first['QuestionText'].toString(),
            options: options));
        return questionWithOptions;
      } catch (e) {
        emit(NextQuestionFailure());
        return [];
      }
    } else {
      if (score > 25) DatabaseServices().updateCognifyTestWinner();
      emit(ChallengeEnd());
      return [];
    }
  }

  // it works well only for the normal quiz where the user takes a subject and take a quiz in it , because it uses the subject ID

  Future<List> generateQuestionWithItsOptionsForNormalQuizOnly(
      String subjectName) async {
    emit(NextQuestionLoading());
    final subjectID = await DatabaseServices().getSubjectId(subjectName);

    if (questionsCounter < 10) {
      try {
        final question =
            await DatabaseServices().getQuestionsForSpecificSubject(subjectID);
        var questionId = question.first['QuestionID'];
        final options = await DatabaseServices()
            .getRandomOptionsOfRandomQuestions(questionId, subjectID);

        List questionWithOptions = [
          {
            'QuestionText': question.first['QuestionText'].toString(),
            'Options': options,
          }
        ];
        emit(NextQuestionSuccessful(
            question: questionWithOptions.first['QuestionText'].toString(),
            options: options));
        return questionWithOptions;
      } catch (e) {
        emit(NextQuestionFailure());
        return [];
      }
    } else {
      emit(ChallengeEnd());
      return [];
    }
  }
}
