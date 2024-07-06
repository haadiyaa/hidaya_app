import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/model/surahlistmodel.dart';
import 'package:hidhayah/model/surahmodel.dart';
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
        emit(SurahlistFetchState(surahListModel: surahListModel));
      } else {
        print('error');
        emit(SurahFetchErrorState(msg: surahListModel.message));
      }
    } catch (e) {
      emit(SurahFetchErrorState(msg: e.toString()));
    }
  }

  Future<void> _fetchSurah(SurahFetchEvent event, Emitter<SurahlistState> emit) async {
    SurahModel surahModel;
    print('object1');
    try {
      final response=await http.get(Uri.parse('${Secrets.surahList}/${event.index}'));
      final data=jsonDecode(response.body);
      print('object2');
      surahModel=SurahModel.fromJson(data);
      if (response.statusCode==200) {
        print('response $data');
        print('object3');
        print(surahModel.data!.verses![1].text!.arab);
        emit(SurahFetchState(surahModel: surahModel));
      } else {
        print('object4');
        emit(SurahFetchErrorState(msg: surahModel.message!));
      }
    } catch (e) {
      print('object5');
      print(e.toString());
      emit(SurahFetchErrorState(msg: e.toString()));
    }
  }
}
