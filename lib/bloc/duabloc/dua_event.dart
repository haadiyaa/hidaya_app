part of 'dua_bloc.dart';

abstract class DuaEvent {}

class FetchDuas extends DuaEvent {}
class FetchIndividualDuas extends DuaEvent {
  final String url;

  FetchIndividualDuas({required this.url});
}
