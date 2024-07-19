import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:hidhayah/model/duamodel.dart';
import 'package:hidhayah/model/duasinglemodel.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:http/http.dart' as http;
part 'dua_event.dart';
part 'dua_state.dart';

class DuaBloc extends Bloc<DuaEvent, DuaState> {
  DuaBloc() : super(DuaInitial()) {
    on<FetchDuas>(_fetchAllDua);
    on<FetchIndividualDuas>(_fetchIndividualDua);
  }

  Future<void> _fetchAllDua(FetchDuas event, Emitter<DuaState> emit) async {
    Duamodel duaModel;
    try {
      final response = await http.get(
        Uri.parse(Secrets.duaApiUrl),
        headers: {'Accept': 'application/json'},
      );
      final body = response.body.substring(3);
      final data = jsonDecode(body);
      if (response.statusCode == 200) {
        duaModel = Duamodel.fromJson(data);
        emit(DuaCetgoriesState(duaModel: duaModel));
      } else {
        print('error');
      }
    } catch (e) {
      print('error $e');
    }
  }

  Future<void> _fetchIndividualDua(
      FetchIndividualDuas event, Emitter<DuaState> emit) async {
    Dua dua;
    try {
      final response = await http.get(Uri.parse(event.url));
      final body = response.body.substring(3);
      final duaData = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      // final data=jsonDecode(body);
      // print(duaData);
      if (response.statusCode == 200) {
        print('object');
        dua = Dua.fromJson(duaData);
        print(dua.duaItems[0].arabicText);
        emit(DuaSingleState(duaModel: dua));
      } else {
        print('errrrorrrr');
      }
    } catch (e) {
      print('errorr $e');
    }
  }
}
