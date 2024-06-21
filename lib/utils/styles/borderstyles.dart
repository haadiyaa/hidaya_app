import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';

class BorderStyles {
  static InputBorder textfieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Constants.greenDark));

  static InputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Constants.greenDark2, width: 2));
  static InputBorder forgotfocusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Constants.greenLight, width: 2));
  static InputBorder forgottextfieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Constants.greenLight));
}
