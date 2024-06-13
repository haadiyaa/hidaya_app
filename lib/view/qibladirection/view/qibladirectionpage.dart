import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

class QiblaDir extends StatefulWidget {
  const QiblaDir({super.key});

  @override
  State<QiblaDir> createState() => _QiblaDirState();
}

class _QiblaDirState extends State<QiblaDir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greenLight,
      appBar: AppBar(
        title: const Text('Qibla'),
      ),
      body: Center(
        child: SmoothCompass(
          compassBuilder: (context, compassData, compassAsset) {
            return SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        // image: DecorationImage(
                        //   image: AssetImage('assets/images/compass/compass.png'),
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
