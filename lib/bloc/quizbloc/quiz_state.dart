part of 'quiz_bloc.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizByCategoryLevelState extends QuizState {
  final QuizByCategoryList quizByCategoryList;

  QuizByCategoryLevelState({required this.quizByCategoryList});
}

class NextQuestionState extends QuizState {
  int currentIndex;
  Color color;

  NextQuestionState({required this.currentIndex, required this.color});
}

class ChengeIndexState extends QuizState {
  int index;

  ChengeIndexState({required this.index});
}

class LastQuestionState extends QuizState {}
