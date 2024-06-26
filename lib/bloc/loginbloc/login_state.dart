part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error ,loggedIn}

class LoginState extends Equatable {
  final String email;
  final String name;
  final String password;
  final String message;
  final LoginStatus loginStatus;
  const LoginState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.message = '',
    this.loginStatus = LoginStatus.initial,
  });
  LoginState copyWith({
    String? email,
    String? name,
    String? password,
    String? message,
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  List<Object?> get props => [email, password, message, loginStatus,name];
}

// class GetUserState extends LoginState {
//   final UserModel user;

//   const GetUserState({required this.user});
// }