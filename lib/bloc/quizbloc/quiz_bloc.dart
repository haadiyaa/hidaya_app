import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:http/http.dart' as http;
part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<QuizByCategoryAndLevelEvent>(_quizbyCategoryLevel);
  }

  Future<void> _quizbyCategoryLevel(
      QuizByCategoryAndLevelEvent event, Emitter<QuizState> emit) async {
    UserModel userModel;
    try {
      final response = await http.get(
          Uri.parse('${Secrets.allQuiz}/${event.category}/${event.level}'));
      final data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        print('success');
        userModel = UserModel.fromMap(data);
      } else {
        print('error');
      }
    } catch (e) {
      print('error $e');
    }
  }
}
