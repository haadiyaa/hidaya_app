import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/qibladirection/widgets/qiblacompass.dart';
import 'package:hidhayah/view/qibladirection/widgets/qiblamap.dart';

class QiblaDir extends StatefulWidget {
  const QiblaDir({super.key});

  @override
  State<QiblaDir> createState() => _QiblaDirState();
}

class _QiblaDirState extends State<QiblaDir> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  bool _snackbarVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greenLight,
      appBar: AppBar(
        title: const Text('Qibla'),
      ),
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (_, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error!!'),
            );
          }
          if (snapshot.data!) {
            return const QiblaCompass();
          } else {
            if (!_snackbarVisibility) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:
                      Text('Your device does not support the Quibla compass serivce')));
              });
              _snackbarVisibility = true;
            }

            return const QiblaMaps();
          }
        },
      ),
    );
  }
}
