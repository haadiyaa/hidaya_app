import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:hidhayah/utils/apirepository/apirepository.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepostiroy _apiRepostiroy = ApiRepostiroy();
  LoginBloc() : super(LoginState()) {
    on<LoginApi>(_loginApi);
    on<SignUpApi>(_signApi);
    on<ForgotPasswordEvent>(_forgotPass);
  }

  FutureOr<void> _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      loginStatus: LoginStatus.loading,
    ));
    UserModel user;
    Map data = {
      "email": event.email,
      "password": event.password,
    };
    try {
      final String token = await _apiRepostiroy.loginUser(data);
      print("token - ${token.toString()}");
      if (token.isEmpty) {
        emit(
          state.copyWith(
            email: event.email,
            message: 'Login successful',
            loginStatus: LoginStatus.success,
          ),
        );
      } else {
        emit(state.copyWith(message: token, loginStatus: LoginStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(
          loginStatus: LoginStatus.error, message: e.toString()));
    }
  }

  Future<void> _signApi(SignUpApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      loginStatus: LoginStatus.loading,
    ));
    Map data = {
      'email': event.user.email,
      'password': event.user.password,
      'name': event.user.name,
      'username': event.user.name,
    };
    try {
      final String response = await _apiRepostiroy.signupUser(data);
      print('respose $response');
      if (response.isEmpty) {
        emit(state.copyWith(
          message: 'Sign Up Successfull!',
          loginStatus: LoginStatus.success,
        ));
      } else {
        emit(state.copyWith(
          message: response,
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

  Future<void> _forgotPass(
      ForgotPasswordEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        loginStatus: LoginStatus.loading, message: 'Please wait...'));
    final body = {
      "email": event.email,
    };
    final String response = await _apiRepostiroy.forgotPass(body);
    if (response.isNotEmpty) {
      emit(state.copyWith(
        message: response,
        loginStatus: LoginStatus.restpass,
      ));
    }
    

    // try {
    //   final response = await http.post(
    //     Uri.parse('${Secrets.authUrl}${Secrets.forgotPassword}'),
    //     body: jsonEncode(body),
    //     headers: {
    //       'Content-Type': 'application/json',
    //     },
    //   );
    //   print(response.body);
    //   final data = jsonDecode(response.body);
    //   if (response == 200) {
    //     emit(state.copyWith(message: data['msg']));
    //   } else {
    //     emit(state.copyWith(message: data['msg']));
    //   }
    // } catch (e) {
    //   emit(state.copyWith(message: e.toString()));
    // }
  }
}
