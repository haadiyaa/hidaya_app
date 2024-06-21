part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{
  const LoginEvent();
  @override
  List<Object?> get props => [];
}
class LoginApi extends LoginEvent {

  final String email;
  final String name;
  final String password;
  const LoginApi({
    required this.email,
    required this.name,
    required this.password,
  });

  @override
  List<Object?> get props => [email,name,password];
  
}

