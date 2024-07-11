part of 'calendar_bloc.dart';

abstract class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object> get props => [];
}

class CalendarInitial extends CalendarState {}
class CalendarFEtchState extends CalendarState {
  final Calendar calendar;

  CalendarFEtchState({required this.calendar});
}
