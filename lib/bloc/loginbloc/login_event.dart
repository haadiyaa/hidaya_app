part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();
  @override
  List<Object?> get props => [];
}
class LoginApi extends LoginEvent {

  final String email;
  final String password;
  const LoginApi({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email,password];
  
}
class SignUpApi extends LoginEvent {
  final UserModel user;
  const SignUpApi({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}
