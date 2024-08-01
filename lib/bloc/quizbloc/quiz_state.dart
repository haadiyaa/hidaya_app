part of 'quiz_bloc.dart';

class QuizState {
  final QuizByCategoryList? quizByCategoryList;
  final int currentIndex;
  final Color color;
  final bool isLast;
  QuizState({
    this.quizByCategoryList,
    this.currentIndex = 0,
    this.color = Constants.greenLight,
    this.isLast=false,
  });
  QuizState copyWith({
    QuizByCategoryList? quizByCategoryList,
    int? currentIndex,
    Color? color,
    bool? isLast,
  }) {
    return QuizState(
      quizByCategoryList: quizByCategoryList ?? this.quizByCategoryList,
      currentIndex: currentIndex ?? this.currentIndex,
      color: color ?? this.color,
      isLast: isLast??this.isLast
    );
  }
}

class QuizInitial extends QuizState {}
class QuizError extends QuizState {
  final String msg;

  QuizError({super.quizByCategoryList, super.currentIndex, super.color, super.isLast, required this.msg});
}

class GetHighScoreState extends QuizState {
  final List<HighScore> highScore;

  GetHighScoreState({super.quizByCategoryList, super.currentIndex, super.color, super.isLast, required this.highScore});
}