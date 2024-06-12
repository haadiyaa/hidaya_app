import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';

class Gradients {
  static const LinearGradient gradientBox1 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Constants.gradGreenLight,
      Constants.gradGreenDark,
    ],
  );
  static const LinearGradient gradientBox2 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Constants.gradBlueLight,
      Constants.gradBlueDark,
    ],
  );
  static const LinearGradient gradientBox3 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Constants.gradRedLight,
      Constants.gradRedDark,
    ],
  );
  static const LinearGradient gradientBox4 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Constants.gradVioletLight,
      Constants.gradVioletDark,
    ],
  );
}