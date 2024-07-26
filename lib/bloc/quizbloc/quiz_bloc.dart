import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/model/quizbycategory.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<QuizByCategoryAndLevelEvent>(_quizbyCategoryLevel);
    on<ChangeIndexEvent>(_changeIndex);
    on<CheckAnsEvent>(_checkAns);
  }

  Future<void> _quizbyCategoryLevel(
      QuizByCategoryAndLevelEvent event, Emitter<QuizState> emit) async {
    QuizByCategoryList quizByCategoryList;
    emit(QuizInitial());
    try {
      final response = await http.get(Uri.parse(
          '${Secrets.authUrl}${Secrets.allQuiz}/${event.category}/${event.level.toLowerCase()}'));
      final data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        print('success');
        quizByCategoryList = QuizByCategoryList.fromJson(data);

        print(quizByCategoryList.quizzes[0].questions![0].question);
        print(quizByCategoryList.quizzes.length);
        emit(QuizState(quizByCategoryList: quizByCategoryList));
      } else {
        emit(QuizError(msg: 'Error occured'));
      }
    } catch (e) {
      print('error $e');
      emit(QuizError(msg: e.toString()));
    }
  }

  FutureOr<void> _changeIndex(ChangeIndexEvent event, Emitter<QuizState> emit) {
    int index = event.currentIndex;
    if (index == event.total) {
      emit(state.copyWith(isLast: true));
    } else {
      index = index + 1;
      emit(state.copyWith(currentIndex: index));
    }
  }

  FutureOr<void> _checkAns(CheckAnsEvent event, Emitter<QuizState> emit) {
    if (event.corerctAns == event.selectedAns) {
      emit(state.copyWith(color: Constants.gradGreenLight));
    } else {
      emit(state.copyWith(color: Constants.gradRedDark));
    }
  }
}
