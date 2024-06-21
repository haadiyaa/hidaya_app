import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginApi>(_loginApi);
    on<SignUpApi>(_signApi);
  }

  FutureOr<void> _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    Map data = {
      "email": event.email,
      "password": event.password,
    };
    try {
      final response = await http.post(Uri.parse('uri'), body: data);
      if (response.statusCode == 200) {}
    } catch (e) {
      state.copyWith(message: e.toString());
    }
  }

  Future<void> _signApi(SignUpApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
          loginStatus: LoginStatus.loading,
        ));
    Map data = {
      "email": event.email,
      "password": event.password,
    };
    try {
      final response = await http
          .post(Uri.parse('${Constants.url}${Constants.register}'), body: data);
          final data1=jsonDecode(response.body);
      if (response.statusCode == 201) {
         emit(state.copyWith(
          message: 'Sign Up Successfull!',
          loginStatus: LoginStatus.success,
        ));
      } else {
        emit(state.copyWith(
          message: data1['msg'],
          loginStatus: LoginStatus.error,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        message: e.toString(),
        loginStatus: LoginStatus.error,
      ));
    }
  }
}
