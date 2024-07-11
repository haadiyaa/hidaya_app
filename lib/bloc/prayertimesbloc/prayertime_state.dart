part of 'prayertime_bloc.dart';

abstract class PrayertimeState {
  const PrayertimeState();
  
}
class FetchPrayerTimeInitial extends PrayertimeState{
  
}
class FetchPrayerTimeState extends PrayertimeState {
  final PrayerTimeModel prayerTimeModel;

  FetchPrayerTimeState({required this.prayerTimeModel}){
    // print('object');
  }
  
  
}
class FetchPrayerTimeErrorState extends PrayertimeState {
  final String msg;
  FetchPrayerTimeErrorState(this.msg);
  
}

