part of 'tasbih_bloc.dart';

abstract class TasbihEvent {
  const TasbihEvent();
}

class TapEvent extends TasbihEvent {
  final BuildContext ctx;

  TapEvent({required this.ctx});
}
