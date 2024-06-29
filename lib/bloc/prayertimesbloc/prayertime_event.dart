part of 'prayertime_bloc.dart';

abstract class PrayertimeEvent {
  const PrayertimeEvent();
}
class FetchPrayerTimeEvent extends PrayertimeEvent {
  final String city;
  final String country;

  FetchPrayerTimeEvent({required this.city, required this.country});
}
