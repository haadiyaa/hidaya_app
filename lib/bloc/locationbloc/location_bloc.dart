import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/functions/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  Position? _currentPosition;
  LocationBloc() : super(LocationInitial()) {
    on<LocationFetchEvent>(_fetchLocation);
  }

  Future<void> _fetchLocation(
      LocationFetchEvent event, Emitter<LocationState> emit) async {
    var sharedPref = await SharedPreferences.getInstance();
    print('dcdwdsassssssdddddddddddddd');
    bool serviceEnabled;
    LocationPermission permission;
    Placemark? _currenLocationName;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _currentPosition = null;
      print('service enabled');
    } else {
      print('servicw enabled true');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        _currentPosition == null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _currentPosition = null;
    }
    _currentPosition = await Geolocator.getCurrentPosition();
    print('CURRENT POSITION : $_currentPosition');

    _currenLocationName = await Functions.getLocationName(_currentPosition);
    print('CURRENT LOCATION NAME: $_currenLocationName');
    if (_currenLocationName != null) {
      emit(LocationFetchState(
          latitude: _currentPosition!.latitude,
          longitude: _currentPosition!.longitude,
          city: _currenLocationName.locality,
          country: _currenLocationName.country));
    } else {
      print('$_currenLocationName null');
    }
  }
}
