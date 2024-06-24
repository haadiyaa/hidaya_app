import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginApi>(_loginApi);
    on<SignUpApi>(_signApi);
    // on<CheckStatusEvent>(_checkStatus);
    // on<LogoutEvent>(_logout);
    // on<GetUserEvent>(_getUser);
  }

  FutureOr<void> _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      loginStatus: LoginStatus.loading,
    ));
    var sharedPref = await SharedPreferences.getInstance();
    Map data = {
      "email": event.email,
      "password": event.password,
    };
    try {
      final response = await http.post(
        Uri.parse('${Constants.url}${Constants.login}'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      final data1 = jsonDecode(response.body);
      if (response.statusCode == 200) {
        await sharedPref
            .setString(Constants.LOGINTOKEN, data1['token'].toString())
            .then(
              (value) => emit(LoginState(
                email: event.email,
                password: event.password,
              )),
            );

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
        Uri.parse('${Constants.url}${Constants.register}'),
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

  // Future<void> _checkStatus(
  //     CheckStatusEvent event, Emitter<LoginState> emit) async {
  //   var sharedPref = await SharedPreferences.getInstance();
  //   var isLoggedIn = sharedPref.getString(Constants.LOGINTOKEN);
  //   if (isLoggedIn != null) {
  //     print('sp; ${isLoggedIn}');
  //     if (isLoggedIn.isNotEmpty) {
  //       print('sp notempt $isLoggedIn');
  //       emit(state.copyWith(loginStatus: LoginStatus.loggedIn));
  //     } else {
  //       print('sp empt $isLoggedIn');
  //       emit(state.copyWith(loginStatus: LoginStatus.initial));
  //     }
  //   } else {
  //     emit(state.copyWith(loginStatus: LoginStatus.initial));
  //   }
  // }

  // Future<void> _logout(LogoutEvent event, Emitter<LoginState> emit) async {
  //   var sharedPref = await SharedPreferences.getInstance();
  //   await sharedPref.remove(Constants.LOGINTOKEN);
  //   emit(state.copyWith(loginStatus: LoginStatus.initial));
  // }

  // Future<void> _getUser(GetUserEvent event, Emitter<LoginState> emit) async {
  //   emit(Loading());
  //   var sharedPref = await SharedPreferences.getInstance();
  //   var isLoggedInToken = sharedPref.getString(Constants.LOGINTOKEN);
  //   UserModel user;
  //   if (isLoggedInToken != null) {
  //     print('isLoggedin !=null $isLoggedInToken');

  //     final Map<String, String>? header = {
  //       'Content-Type': 'application/json',
  //       'x-auth-token': isLoggedInToken,
  //     };
  //     try {
  //       final response = await http.get(
  //         Uri.parse('${Constants.url}${Constants.getUser}'),
  //         headers: header,
  //       );
  //       print(response.body);
  //       final data = jsonDecode(response.body);
  //       if (response.statusCode == 200) {
  //         user = UserModel.fromMap(data);
  //         print('user name: ${user.name}');
  //         emit(GetUserState(user: user));
  //         print('success');
  //       } else {
  //         emit(GetUserErrorState(msg: data['msg']));
  //         print('not success');
  //       }
  //     } catch (e) {
  //       print('excetion $e');
  //       emit(GetUserErrorState(msg: e.toString()));
  //     }
  //   } else {
  //     print('isloggedin null');
  //   }
  // }
}
