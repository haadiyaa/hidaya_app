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
