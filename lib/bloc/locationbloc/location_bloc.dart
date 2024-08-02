import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hidhayah/model/markermodel.dart';
import 'package:hidhayah/secrets/secrets.dart';
import 'package:hidhayah/utils/functions/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  Position? _currentPosition;
  LocationBloc() : super(LocationInitial()) {
    on<LocationFetchEvent>(_fetchLocation);
    on<FetchNearbyMasjidEvent>(_fetchNearbyMasjid);
  }

  Future<void> _fetchLocation(
      LocationFetchEvent event, Emitter<LocationState> emit) async {
    var sharedPref = await SharedPreferences.getInstance();
    // print('dcdwdsassssrrrdddddddd');
    bool serviceEnabled;
    LocationPermission permission;
    Placemark? _currenLocationName;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _currentPosition = null;
      // print('service enabled');
    } else {
      // print('servicw enabled true');
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
    // print('CURRENT POSITION : $_currentPosition');

    _currenLocationName = await Functions.getLocationName(_currentPosition);
    // print('CURRENT LOCATION NAME: $_currenLocationName');
    if (_currenLocationName != null) {
      emit(LocationFetchState(
          latitude: _currentPosition!.latitude,
          longitude: _currentPosition!.longitude,
          city: _currenLocationName.locality,
          country: _currenLocationName.country));
    } else {
      // print('$_currenLocationName null');
      emit(LocationFetchErrorState(msg: 'Can\'t fetch location! try again'));
    }
  }

  Future<void> _fetchNearbyMasjid(
      FetchNearbyMasjidEvent event, Emitter<LocationState> emit) async {
    NearbyPlace nearbyPlace;
    final data = {
      "includedTypes": ["mosque"],
      "maxResultCount": 10,
      "locationRestriction": {
        "circle": {
          "center": {
            "latitude": event.lat,
            "longitude": event.long,
          },
          "radius": 500,
        }
      }
    };
    try {
      final response = await http.post(
        Uri.parse(Secrets.nearbyPlaceUrl),
        headers: {
          "Content-Type": "application/json",
          "X-Goog-Api-Key": 'AIzaSyB2AUUmiY9Atpd97w7SQHCZ45HQAXm8U_c',
        },
        body: jsonEncode(data),
      );
      final data1 = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        nearbyPlace = NearbyPlace.fromJson(data1);
        emit(FetchNearbyMasjidState(places: nearbyPlace));
      } else {
        // print('error');
        emit(FetchNearbyMasjidErrorState(
            msg: data1['error']['message'].toString()));
        print('Error: ${data1['error']['message'].toString()}');
      }
    } catch (e) {
      print('Exception : ${e.toString()}');
    }
  }
}
