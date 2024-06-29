part of 'location_bloc.dart';

sealed class LocationState {
  const LocationState();
}

final class LocationInitial extends LocationState {}

class LocationFetchState extends LocationState {
  final String? city;
  final String? country;

  LocationFetchState({
    required this.city,
    required this.country,
  });
}
