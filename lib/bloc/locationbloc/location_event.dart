part of 'location_bloc.dart';

sealed class LocationEvent{
  const LocationEvent();
}
class LocationFetchEvent extends LocationEvent {}

