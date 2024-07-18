part of 'dua_bloc.dart';

abstract class DuaState {
}

class DuaInitial extends DuaState {}
class DuaCetgoriesState extends DuaState {
  final Duamodel duaModel;

  DuaCetgoriesState({required this.duaModel});
}
