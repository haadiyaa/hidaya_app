part of 'status_bloc.dart';

abstract class StatusState {}

class StatusInitial extends StatusState {}
class StatusCheckState extends StatusState {
  final Status status;
  final UserModel? user;

  StatusCheckState({this.status=Status.loggedIn, this.user});
}
