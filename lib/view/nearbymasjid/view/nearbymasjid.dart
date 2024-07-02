import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hidhayah/utils/constants/constants.dart';

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
  Completer<GoogleMapController> _controller=Completer();
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
        mapType: MapType.hybrid,
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
