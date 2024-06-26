import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    var sharedPref = await SharedPreferences.getInstance();
    if (event.value + 1 == initial) {
      initial = 0;
      loop++;
    }
    var count = sharedPref.getInt(Constants.count);
    if (count != null) {
      initial = count;
    }
    await Future.delayed(
      const Duration(milliseconds: 200),
      () => emit(IncrementState(
        value: initial++,
        loop: loop,
      )),
    );
    sharedPref.setInt(Constants.count, initial);
  }

  Future<void> _reset(ResetEvent event, Emitter<TasbihState> emit) async {
    var sharedPref = await SharedPreferences.getInstance();

    initial = 0;
    loop = 0;
    sharedPref.setInt(Constants.count, initial);
    emit(ResetState(value: initial, loop: loop));
  }

  FutureOr<void> _dropdown(
      DropdownChangedEvent event, Emitter<TasbihState> emit) {
    emit(DropdownChangeState(value: event.value));
  }
}
