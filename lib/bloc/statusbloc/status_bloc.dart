import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hidhayah/bloc/functionbloc/functions_bloc.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'status_event.dart';
part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  StatusBloc() : super(StatusInitial()) {
    on<CheckStatusQuizEvent>(_checkStatus);
  }

  Future<void> _checkStatus(CheckStatusQuizEvent event, Emitter<StatusState> emit) async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getString(Constants.LOGINTOKEN);
    if (isLoggedIn != null) {
      // print('sp; ${isLoggedIn.toString()}');
      if (isLoggedIn.isNotEmpty) {
        // print('sp notempt $isLoggedIn');
            // print('success');
            emit(StatusCheckState(status: Status.loggedIn));
      } else {
        // print('sp empt $isLoggedIn');
        emit(StatusCheckState(status: Status.notLoggedIn));
      }
    } else {
      emit(StatusCheckState(status: Status.notLoggedIn));
    }
  }
}
