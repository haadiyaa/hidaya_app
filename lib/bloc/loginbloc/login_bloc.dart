import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
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
    var sharedPref = await SharedPreferences.getInstance();
    Map data = {
      "email": event.email,
      "password": event.password,
    };
    try {
      final response = await http.post(
        Uri.parse('${Secrets.authUrl}${Secrets.login}'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      final data1 = jsonDecode(response.body);
      if (response.statusCode == 200) {
        await sharedPref.setString(
            Constants.LOGINTOKEN, data1['token'].toString());
        final Map<String, String>? header = {
          'Content-Type': 'application/json',
          'x-auth-token': data1['token'],
        };
        final response = await http.get(
          Uri.parse('${Secrets.authUrl}${Secrets.getUser}'),
          headers: header,
        );
        print(response.body);
        final data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          user = UserModel.fromMap(data);
          print('user name: ${user.name}');

          // emit(GetUserState(user: user));
          emit(state.copyWith(name: user.name, email: user.email));
          emit(LoginState(
            name: user.name!,
            email: event.email,
            password: event.password,
          ));
        } else {
          print('error getting user data');
          print('not success');
        }

        emit(state.copyWith(
          message: 'Login Successfull!',
          loginStatus: LoginStatus.success,
        ));
        print(' token: ${data1['token']}');
      } else {
        emit(state.copyWith(
          message: data1["msg"],
          loginStatus: LoginStatus.error,
        ));
      }
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(
        message: e.toString(),
        loginStatus: LoginStatus.error,
      ));
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
    };
    try {
      final response = await http.post(
        Uri.parse('${Secrets.authUrl}${Secrets.register}'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);

      final data1 = jsonDecode(response.body);
      if (response.statusCode == 201) {
        emit(LoginState(
            email: event.user.email!,
            password: event.user.password!,
            name: event.user.name!));
        emit(state.copyWith(
          message: 'Sign Up Successfull!',
          loginStatus: LoginStatus.success,
        ));
      } else {
        emit(state.copyWith(
          message: data1["msg"],
          loginStatus: LoginStatus.error,
        ));
      }
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(
        message: e.toString(),
        loginStatus: LoginStatus.error,
      ));
    }
  }

  Future<void> _forgotPass(
      ForgotPasswordEvent event, Emitter<LoginState> emit) async {
    final body = {
      "email": event.email,
    };
    try {
      final response = await http.post(
        Uri.parse('${Secrets.authUrl}${Secrets.forgotPassword}'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
      final data = jsonDecode(response.body);
      if (response == 200) {
        emit(state.copyWith(message: data['msg']));
      } else {
        emit(state.copyWith(message: data['msg']));
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString()));
    }
  }
}
