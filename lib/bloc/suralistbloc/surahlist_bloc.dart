import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hidhayah/model/surahlistmodel.dart';

part 'surahlist_event.dart';
part 'surahlist_state.dart';

class SurahlistBloc extends Bloc<SurahlistEvent, SurahlistState> {
  SurahlistBloc() : super(SurahlistInitial()) {
    on<SurahFetchEvent>(_fetchSurah);
  }

  FutureOr<void> _fetchSurah(SurahFetchEvent event, Emitter<SurahlistState> emit) {
  }
}