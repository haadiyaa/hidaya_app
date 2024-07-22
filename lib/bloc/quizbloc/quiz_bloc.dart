import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/model/quizbycategory.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<QuizByCategoryAndLevelEvent>(_quizbyCategoryLevel);
    on<NextQuestionEvent>(_gotoNext);
    on<ChangeIndexEvent>(_changeIndex);
    on<CheckAnsEvent>(_checkAns);
  }

  Future<void> _quizbyCategoryLevel(
      QuizByCategoryAndLevelEvent event, Emitter<QuizState> emit) async {
    QuizByCategoryList quizByCategoryList;
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
        emit(QuizByCategoryLevelState(quizByCategoryList: quizByCategoryList));
      } else {
        print('error');
      }
    } catch (e) {
      print('error $e');
    }
  }

  FutureOr<void> _gotoNext(NextQuestionEvent event, Emitter<QuizState> emit) {
    if (event.correctAns == event.selectedAns) {
      event.selectedTileColor = Constants.gradGreenLight;
    } else {
      event.selectedTileColor = Constants.gradRedDark;
    }
    if (event.currentIndex < event.total) {
      emit(NextQuestionState(
          currentIndex: event.currentIndex, color: event.selectedTileColor));
      Future.delayed(
        const Duration(seconds: 1),
        () {
          event.currentIndex++;
          event.selectedTileColor = Constants.greenLight;
          emit(NextQuestionState(
              currentIndex: event.currentIndex,
              color: event.selectedTileColor));
        },
      );
    } else {
      print('error');
    }
  }

  FutureOr<void> _changeIndex(ChangeIndexEvent event, Emitter<QuizState> emit) {
    if (event.currentIndex == event.total) {
      emit(LastQuestionState());
    } else {
      int index = event.currentIndex + 1;
      emit(ChengeIndexState(index: index));
    }
  }

  FutureOr<void> _checkAns(CheckAnsEvent event, Emitter<QuizState> emit) {}
}
