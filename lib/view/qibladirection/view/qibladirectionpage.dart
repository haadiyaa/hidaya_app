import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/qibladirection/widgets/qiblacompass.dart';

class QiblaDir extends StatefulWidget {
  const QiblaDir({super.key});

  @override
  State<QiblaDir> createState() => _QiblaDirState();
}

class _QiblaDirState extends State<QiblaDir> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
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
            //maaaaaaapppppppppppppp
           return  const Center(child: Text('map'));
          
        }}
      ),
    );
  }
}
