part of 'functions_bloc.dart';

enum Status{notLoggedIn,loggedIn,loading}

 class FunctionsState {
  const FunctionsState({this.status=Status.notLoggedIn});
  final Status status;

  FunctionsState copyWith({
    Status? status,
  }) {
    return FunctionsState(status: status??this.status,);
  }
}

final class FunctionsInitial extends FunctionsState {}

class CheckstatusState extends FunctionsState {
  
  

  CheckstatusState();
}

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
