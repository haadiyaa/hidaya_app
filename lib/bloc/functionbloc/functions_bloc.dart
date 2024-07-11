import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'functions_event.dart';
part 'functions_state.dart';

class FunctionsBloc extends Bloc<FunctionsEvent, FunctionsState> {
  FunctionsBloc() : super(FunctionsInitial()) {
    on<CheckStatusEvent>(_checkStatus);
    on<LogoutEvent>(_logout);
  }
  Future<void> _checkStatus(
      CheckStatusEvent event, Emitter<FunctionsState> emit) async {
        emit(state.copyWith(status: Status.loading));
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getString(Constants.LOGINTOKEN);
    UserModel user;
    if (isLoggedIn != null) {
      // print('sp; ${isLoggedIn.toString()}');
      if (isLoggedIn.isNotEmpty) {
        // print('sp notempt $isLoggedIn');
            // print('success');
            emit(state.copyWith(status: Status.loggedIn));
      } else {
        // print('sp empt $isLoggedIn');
        emit(state.copyWith(status: Status.notLoggedIn));
      }
    } else {
      emit(state.copyWith(status: Status.notLoggedIn));
    }
  }

  Future<void> _logout(LogoutEvent event, Emitter<FunctionsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var sharedPref = await SharedPreferences.getInstance();
    await sharedPref.remove(Constants.userEmail);
    await sharedPref.remove(Constants.userName);
    await sharedPref.remove(Constants.LOGINTOKEN);
    emit(state.copyWith(status: Status.notLoggedIn));
  }
}
