import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/calendarbloc/calendar_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarpageWrapper extends StatelessWidget {
  const CalendarpageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarBloc(),
      child: const CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CalendarBloc>(context).add(ClendarFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greenDark2,
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Constants.greenLight,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.only(bottom: 10),
              margin: const EdgeInsets.all(20),
              child: TableCalendar(
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2040, 10, 16),
                calendarStyle: CalendarStyle(
                  
                  dayTextFormatter: (date, locale) {
                    final h_date = HijriCalendar.fromDate(date);
                    print('${h_date.hMonth}-${h_date.longMonthName}');
                    return '${h_date.hDay.toString()}\n${h_date.shortMonthName}';
                  },
                  outsideDaysVisible: false,
                  defaultTextStyle: TextStyle(color: Constants.black),
                  
                  // cellPadding: EdgeInsets.all(5),
                  todayDecoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    color: Constants.greenDark,
                    
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
