import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hidhayah/model/surahlistmodel.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:http/http.dart' as http;

part 'surahlist_event.dart';
part 'surahlist_state.dart';

class SurahlistBloc extends Bloc<SurahlistEvent, SurahlistState> {
  SurahlistBloc() : super(SurahlistInitial()) {
    on<SurahFetchEvent>(_fetchSurah);
  }

  Future<void> _fetchSurah(
      SurahFetchEvent event, Emitter<SurahlistState> emit) async {
    try {
      final response = await http.get(Uri.parse(Secrets.surahList));
      if (response.statusCode == 200) {
        print('response ${response.body}');
      } else {
        print('error');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
