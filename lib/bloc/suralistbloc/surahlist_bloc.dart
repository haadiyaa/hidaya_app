import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/model/surahlistmodel.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:hidhayah/utils/apirepository/apirepository.dart';
import 'package:http/http.dart' as http;

part 'surahlist_event.dart';
part 'surahlist_state.dart';

class SurahlistBloc extends Bloc<SurahlistEvent, SurahlistState> {
  final ApiRepostiroy _apiRepostiroy=ApiRepostiroy();
  SurahlistBloc() : super(SurahlistInitial()) {
    on<SurahlistFetchEvent>(_fetchSurahlist);
    on<SurahFetchEvent>(_fetchSurah);
  }

  Future<void> _fetchSurahlist(
      SurahlistFetchEvent event, Emitter<SurahlistState> emit) async {
        SurahListModel surahListModel;
    try {
      final http.Response response = await _apiRepostiroy.surahList();
      final data=jsonDecode(response.body);
      surahListModel=SurahListModel.fromJson(data);
      if (response.statusCode == 200) {
        
        print('response $data');
        
        print(surahListModel.data[1].name.transliteration.en);
        emit(SurahlistFetchState(surahListModel: surahListModel));
      } else {
        print('error');
        emit(SurahFetchErrorState(msg: surahListModel.message));
      }
    } catch (e) {
      emit(SurahFetchErrorState(msg: e.toString()));
    }
  }

  FutureOr<void> _fetchSurah(SurahFetchEvent event, Emitter<SurahlistState> emit) {
    try {
      
    } catch (e) {
      
    }
  }
}
