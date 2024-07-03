import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hidhayah/bloc/locationbloc/location_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';

class NearbyWrapper extends StatelessWidget {
  const NearbyWrapper(
      {super.key, required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc(),
      child: NearByMasjid(
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }
}

class NearByMasjid extends StatefulWidget {
  const NearByMasjid({
    super.key,
    required this.latitude,
    required this.longitude,
  });
  final double latitude;
  final double longitude;

  @override
  State<NearByMasjid> createState() => _NearByMasjidState();
}

class _NearByMasjidState extends State<NearByMasjid> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LocationBloc>(context).add(
        FetchNearbyMasjidEvent(lat: widget.latitude, long: widget.longitude));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greenDark,
      appBar: AppBar(
        title: const Text('Nearby Masjid'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 15,
        ),
        compassEnabled: true,
        markers: {
          Marker(
            markerId: const MarkerId('myLocation'),
            position: LatLng(widget.latitude, widget.longitude),
            icon: BitmapDescriptor.defaultMarker,
          ),
        },
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
