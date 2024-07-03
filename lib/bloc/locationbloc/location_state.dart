part of 'location_bloc.dart';

sealed class LocationState {
  const LocationState();
}

final class LocationInitial extends LocationState {}

class LocationFetchState extends LocationState {
  final String? city;
  final String? country;
  final double latitude;
  final double longitude;

  LocationFetchState({
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
  });
}
class LocationFetchErrorState extends LocationState{
  final String msg;

  LocationFetchErrorState({required this.msg});
}

class FetchNearbyMasjidState extends LocationState {
  final NearbyPlace places;

  FetchNearbyMasjidState({required this.places});
}
class FetchNearbyMasjidErrorState extends LocationState{
  final String msg;

  FetchNearbyMasjidErrorState({required this.msg});
}
