part of 'quiz_bloc.dart';

abstract class QuizEvent {}

class QuizByCategoryAndLevelEvent extends QuizEvent {
  final String category;
  final String level;

  QuizByCategoryAndLevelEvent({required this.category, required this.level});
}
