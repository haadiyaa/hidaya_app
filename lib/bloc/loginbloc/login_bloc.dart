import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginApi>(_loginApi);
  }

  FutureOr<void> _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    Map data = {
      "email": event.email,
      "username": event.name,
      "name": event.name,
      "password": event.password,
    };
    try {
      final response = await http.post(Uri.parse('uri'), body: data);
      if (response.statusCode==200) {
        
      }
    } catch (e) {
      state.copyWith(message: e.toString());
    }
  }
}
