import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hidhayah/model/calendar.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:http/http.dart' as http;
part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    on<ClendarFetchEvent>(_fetchCalendar);
  }

  Future<void> _fetchCalendar(CalendarEvent event, Emitter<CalendarState> emit) async {
    Calendar calendar;
    try {
      final response=await http.get(Uri.parse('${Secrets.calendarUrl}7/2024'));
      print(response.body);
      if (response.statusCode==200) {
        final data=jsonDecode(response.body);
        calendar=Calendar.fromJson(data);
        print('calendar $calendar');
        emit(CalendarFEtchState(calendar: calendar));
      }
      else{print('error fetching calendar');}
    } catch (e) {
      print(e.toString());
    }
  }
}
