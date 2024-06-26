// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasbih_bloc.dart';

abstract class TasbihEvent {
  const TasbihEvent();
}

class TapEvent extends TasbihEvent {
  final BuildContext ctx;

  TapEvent({required this.ctx});
}

class IncreaseCounterEvent extends TasbihEvent{
  final int value;
  IncreaseCounterEvent({required this.value});

}

class DropdownChangedEvent extends TasbihEvent {
  int value;
  DropdownChangedEvent({
    required this.value,
  });
}

class ResetEvent extends TasbihEvent{

}
