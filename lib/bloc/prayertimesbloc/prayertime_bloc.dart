import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/model/prayertimemodel.dart';
import 'package:hidhayah/utils/apirepository/apirepository.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

part 'prayertime_event.dart';
part 'prayertime_state.dart';

class PrayertimeBloc extends Bloc<PrayertimeEvent, PrayertimeState> {
  final ApiRepostiroy _apiRepostiroy=ApiRepostiroy();
  PrayertimeBloc() : super(FetchPrayerTimeInitial()) {
    on<FetchPrayerTimeEvent>(_fetchPrayertime);
  }

  Future<void> _fetchPrayertime(
      FetchPrayerTimeEvent event, Emitter<PrayertimeState> emit) async {
        emit(FetchPrayerTimeInitial());
    final year = DateFormat('yyyy').format(DateTime.now());
    final month = DateFormat('MM').format(DateTime.now());
    // print('month $month');
    // print('fetching prayer time');
    PrayerTimeModel prayerTimeModel;
    try {
      // final response = await http.get(Uri.parse(
      //     '${Secrets.prayerUrl}$year/$month${Secrets.city}${event.city}${Secrets.country}${event.country}${Secrets.end}'));
      final http.Response response= await _apiRepostiroy.fetchPrayertime(year,month,event.city,event.country);
      // print('response.body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // print('data: $data');
        prayerTimeModel = PrayerTimeModel.fromJson(data);
        // print('prayerTimeModel: $prayerTimeModel');
        print(prayerTimeModel.data[1].timings.Fajr);
        emit(FetchPrayerTimeState(prayerTimeModel: prayerTimeModel));
        // print('emittedddssssssssssssssssssssssssssssssssssssssss');
      } else {
        // print('error fetch');
        emit(FetchPrayerTimeErrorState('error fetching data'));
      }
    } catch (e) {
      emit(FetchPrayerTimeErrorState(e.toString()));
    }
  }
}
