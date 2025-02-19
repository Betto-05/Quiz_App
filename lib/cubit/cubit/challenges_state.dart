part of 'challenges_cubit.dart';

@immutable
sealed class ChallengesState {}

final class ChallengesInitial extends ChallengesState {}

final class NextQuestionLoading extends ChallengesState {}

final class NextQuestionFailure extends ChallengesState {}

final class NextQuestionSuccessful extends ChallengesState {
  final String question;
  final List options;

  NextQuestionSuccessful({required this.question, required this.options});
}

final class ChallengeEnd extends ChallengesState {}
