part of 'location_bloc.dart';

sealed class LocationEvent{
  const LocationEvent();
}
class LocationFetchEvent extends LocationEvent {}

class FetchNearbyMasjidEvent extends LocationEvent{
  final double lat;
  final double long;

  FetchNearbyMasjidEvent({required this.lat, required this.long});
}