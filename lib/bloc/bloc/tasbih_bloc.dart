import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'tasbih_event.dart';
part 'tasbih_state.dart';

class TasbihBloc extends Bloc<TasbihEvent, TasbihState> {
  int initial = 0;
  int loop = 0;
  TasbihBloc() : super(TasbihInitial()) {
    on<TapEvent>(_tap);
    on<IncreaseCounterEvent>(_increase);
    on<ResetEvent>(_reset);
    on<DropdownChangedEvent>(_dropdown);
  }

  Future<void> _tap(TapEvent event, Emitter<TasbihState> emit) async {
    emit(TapState(
        height: MediaQuery.of(event.ctx).size.width * 0.9,
        width: MediaQuery.of(event.ctx).size.width * 0.9));
    await Future.delayed(
      const Duration(milliseconds: 100),
      () => emit(TapState(
          height: MediaQuery.of(event.ctx).size.width * 0.85,
          width: MediaQuery.of(event.ctx).size.width * 0.85)),
    );
  }

  Future<void> _increase(
      IncreaseCounterEvent event, Emitter<TasbihState> emit) async {
    if (event.value +1== initial) {
      initial = 0;
      loop++;
    }
    await Future.delayed(
      const Duration(milliseconds: 200),
      () => emit(IncrementState(
        value: initial++,
        loop: loop,
      )),
    );
  }

  FutureOr<void> _reset(ResetEvent event, Emitter<TasbihState> emit) {
    
    emit(IncrementState(value: 0,loop: 0));
  }

  FutureOr<void> _dropdown(DropdownChangedEvent event, Emitter<TasbihState> emit) {
    emit(DropdownChangeState(value: event.value));
  }
}
