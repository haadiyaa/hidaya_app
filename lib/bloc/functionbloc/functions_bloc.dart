import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'functions_event.dart';
part 'functions_state.dart';

class FunctionsBloc extends Bloc<FunctionsEvent, FunctionsState> {
  FunctionsBloc() : super(FunctionsInitial()) {
    on<CheckStatusEvent>(_checkStatus);
    on<LogoutEvent>(_logout);
    // on<GetUserEvent>(_getUser);
  }
  Future<void> _checkStatus(
      CheckStatusEvent event, Emitter<FunctionsState> emit) async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getString(Constants.LOGINTOKEN);
    UserModel user;
    if (isLoggedIn != null) {
      print('sp; ${isLoggedIn}');
      if (isLoggedIn.isNotEmpty) {
        print('sp notempt $isLoggedIn');
        emit(state.copyWith(status: Status.loggedIn));
        final Map<String, String>? header = {
          'Content-Type': 'application/json',
          'x-auth-token': isLoggedIn,
        };
        try {
          final response = await http.get(
            Uri.parse('${Constants.url}${Constants.getUser}'),
            headers: header,
          );
          print(response.body);
          final data = jsonDecode(response.body);
          if (response.statusCode == 200) {
            user = UserModel.fromMap(data);
            print('user name: ${user.name}');
            emit(GetUserState(user: user));
            print('success');
          } else {
            emit(GetUserErrorState(msg: data['msg']));
            print('not success');
          }
        } catch (e) {
          print('excetion $e');
          emit(GetUserErrorState(msg: e.toString()));
        }
      } else {
        print('sp empt $isLoggedIn');
        emit(state.copyWith(status: Status.notLoggedIn));
      }
    } else {
      emit(state.copyWith(status: Status.notLoggedIn));
    }
  }

  Future<void> _logout(LogoutEvent event, Emitter<FunctionsState> emit) async {
    var sharedPref = await SharedPreferences.getInstance();
    await sharedPref.remove(Constants.LOGINTOKEN);
    emit(state.copyWith(status: Status.notLoggedIn));
  }

  // Future<void> _getUser(
  //     GetUserEvent event, Emitter<FunctionsState> emit) async {
  //   emit(const Loading());

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
