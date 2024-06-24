import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hidhayah/view/qibladirection/widgets/locationerror.dart';

class QiblaMaps extends StatefulWidget {
  static const meccaLatLong = LatLng(21.422487, 39.826206);
  static final meccaMarker = Marker(
    markerId: const MarkerId("mecca"),
    position: meccaLatLong,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    draggable: false,
  );
  const QiblaMaps({super.key});

  @override
  State<QiblaMaps> createState() => _QiblaMapsState();
}

class _QiblaMapsState extends State<QiblaMaps> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng position = const LatLng(11.258753, 75.780411);

  late final _future = _checkLocationStatus();
  final _positionStream = StreamController<LatLng>.broadcast();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _positionStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _future,
        builder: (_, AsyncSnapshot<Position?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return LocationErrorWidget(
              error: snapshot.error.toString(),
            );
          }

          if (snapshot.hasData) {
            final userLocation = snapshot.data!;
            if (userLocation.latitude != 0.0 && userLocation.longitude != 0.0) {
              final loc = LatLng(userLocation.latitude, userLocation.longitude);
              position = loc;
            } else {
              print('user location not fetched');
            }
          } else {
            _positionStream.sink.add(position);
          }

          return StreamBuilder(
            stream: _positionStream.stream,
            builder: (_, AsyncSnapshot<LatLng> snapshot) => GoogleMap(
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              compassEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: position,
                zoom: 11,
              ),
              markers: <Marker>{
                QiblaMaps.meccaMarker,
                Marker(
                  draggable: true,
                  markerId: const MarkerId('Marker'),
                  position: position,
                  icon: BitmapDescriptor.defaultMarker,
                  onTap: _updateCamera,
                  onDragEnd: (LatLng value) {
                    position = value;
                    _positionStream.sink.add(value);
                  },
                  zIndex: 5,
                ),
              },
              circles: <Circle>{
                Circle(
                  circleId: const CircleId("Circle"),
                  radius: 10,
                  center: position,
                  fillColor: Theme.of(context).primaryColorLight.withAlpha(100),
                  strokeWidth: 1,
                  strokeColor:
                      Theme.of(context).primaryColorDark.withAlpha(100),
                  zIndex: 3,
                )
              },
              polylines: <Polyline>{
                Polyline(
                  polylineId: const PolylineId("Line"),
                  points: [position, QiblaMaps.meccaLatLong],
                  color: Theme.of(context).primaryColor,
                  width: 5,
                  zIndex: 4,
                  geodesic: true,
                )
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          );
        },
      ),
    );
  }

  Future<Position?> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled) {
      return await Geolocator.getCurrentPosition();
    }
    return null;
  }

  void _updateCamera() async {
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(position, 20));
  }
}
