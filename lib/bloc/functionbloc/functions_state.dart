part of 'functions_bloc.dart';

enum Status { notLoggedIn, loggedIn, loading }

class FunctionsState {
  const FunctionsState(
      {this.user ,
      this.status = Status.notLoggedIn});
  final Status status;
  final UserModel? user;
  FunctionsState copyWith({
    Status? status,
    UserModel? user
  }) {
    return FunctionsState(
        status: status ?? this.status, user: user ?? this.user);
  }
}

final class FunctionsInitial extends FunctionsState {}

class Loading extends FunctionsState {
  const Loading();
}

class GetUserState extends FunctionsState {
  final UserModel user;

  const GetUserState({required this.user});
}

class GetUserErrorState extends FunctionsState {
  final String msg;

  const GetUserErrorState({required this.msg});
}
