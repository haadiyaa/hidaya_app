part of 'dua_bloc.dart';

abstract class DuaState {
}

class DuaInitial extends DuaState {}
class DuaCetgoriesState extends DuaState {
  final Duamodel duaModel;

  DuaCetgoriesState({required this.duaModel});
}
class DuaSingleState extends DuaState {
  final Dua duaModel;

  DuaSingleState({required this.duaModel});
}
class DuaErrorState extends DuaState {
  final String msg;

  DuaErrorState({required this.msg});
}