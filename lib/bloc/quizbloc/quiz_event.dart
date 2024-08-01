part of 'quiz_bloc.dart';

abstract class QuizEvent {}

class QuizByCategoryAndLevelEvent extends QuizEvent {
  final String category;
  final String level;

  QuizByCategoryAndLevelEvent({required this.category, required this.level});
}

class NextQuestionEvent extends QuizEvent {
  int currentIndex;
  int total;
  String correctAns;
  String selectedAns;
  Color selectedTileColor;
  NextQuestionEvent(
      {required this.currentIndex,
      required this.correctAns,
      required this.selectedAns,
      required this.selectedTileColor,
      required this.total});
}

class ChangeIndexEvent extends QuizEvent {
  final int currentIndex;
  final int total;
  ChangeIndexEvent({
    required this.currentIndex,
    required this.total,
  });
}

class CheckAnsEvent extends QuizEvent {
  // final Color color;
  final String corerctAns;
  final String selectedAns;
  CheckAnsEvent({
    required this.corerctAns,
    // required this.color,
    required this.selectedAns,
  });
}

class GetHighScoreEvent extends QuizEvent {
  
}
