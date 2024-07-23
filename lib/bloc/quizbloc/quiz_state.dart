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