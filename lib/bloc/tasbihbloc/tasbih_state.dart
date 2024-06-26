// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasbih_bloc.dart';

abstract class TasbihState {
  const TasbihState();
}

class TasbihInitial extends TasbihState {}
class TapState extends TasbihState {
  final double height;
  final double width;

  TapState({required this.height, required this.width});
}
class IncrementState extends TasbihState {
  int value;
  int? loop;
  IncrementState({
    required this.value,
     this.loop,
  });
}
class ResetState extends TasbihState {
  int value;
  int? loop;
  ResetState({
    required this.value,
     this.loop,
  });
}
class DropdownChangeState extends TasbihState {
  int value;
  DropdownChangeState({
    required this.value,
  });
}


