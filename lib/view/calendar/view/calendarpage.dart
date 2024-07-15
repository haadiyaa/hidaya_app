import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:islamic_hijri_calendar/islamic_hijri_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greenDark2,
      appBar: AppBar(title: const Text('Calendar')),
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
              child: const IslamicHijriCalendar(
                defaultBackColor: Constants.transparent,
                defaultBorder: Constants.transparent,
                highlightBorder: Constants.greenDark,
                defaultTextColor: Constants.greenDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
