import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'tasbih_event.dart';
part 'tasbih_state.dart';

class TasbihBloc extends Bloc<TasbihEvent, TasbihState> {
  TasbihBloc() : super(TasbihInitial()) {
    on<TapEvent>(_tap);
  }

  Future<void> _tap(TapEvent event, Emitter<TasbihState> emit) async {
    emit(TapState(
        height: MediaQuery.of(event.ctx).size.width * 0.9,
        width: MediaQuery.of(event.ctx).size.width * 0.9));
    await Future.delayed(
      const Duration(milliseconds: 500),
      () => emit(
        TapState(
            height: MediaQuery.of(event.ctx).size.width * 0.85,
            width: MediaQuery.of(event.ctx).size.width * 0.85),
      ),
    );
  }
}
