part of 'functions_bloc.dart';

abstract class FunctionsEvent {
  const FunctionsEvent();
}
class CheckStatusEvent extends FunctionsEvent {
  const CheckStatusEvent();
}
class LogoutEvent extends FunctionsEvent {
  const LogoutEvent();
}

class GetUserEvent extends FunctionsEvent {

  const GetUserEvent();
}
