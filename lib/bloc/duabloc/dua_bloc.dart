import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hidhayah/model/duamodel.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:http/http.dart' as http;

part 'dua_event.dart';
part 'dua_state.dart';

class DuaBloc extends Bloc<DuaEvent, DuaState> {
  DuaBloc() : super(DuaInitial()) {
    on<FetchDuas>(_fetchAllDua);
  }

  Future<void> _fetchAllDua(FetchDuas event, Emitter<DuaState> emit) async {
    DuaModel duaModel;
    try {
      final response = await http.get(
        Uri.parse(Secrets.duaApiUrl),
        headers: {'Accept': 'application/json'},
      );
      print(response.body);
      final data = jsonDecode(jsonEncode(response.body));
      if (response.statusCode == 200) {
        print('object');
        duaModel = DuaModel.fromJson(data);
        emit(DuaCetgoriesState(duaModel: duaModel));
      } else {
        print('error');
      }
    } catch (e) {
      print('error $e');
    }
  }
}
