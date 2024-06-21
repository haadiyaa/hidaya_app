
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/borderstyles.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class ForgotTextField extends StatelessWidget {
  const ForgotTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.textInputType,
    this.validator,
  });
  final FocusNode focusNode;
  final String label;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: TextFormField(autofocus: true,
        cursorColor: Constants.white,
        style: TextStyles.forgottextFieldStyle,
        validator: validator,
        keyboardType: textInputType,
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyles.forgotLabelStyle,
          enabledBorder: BorderStyles.forgottextfieldBorder,
          focusedBorder: BorderStyles.forgotfocusedBorder,
          focusedErrorBorder: BorderStyles.forgotfocusedBorder,
          errorBorder: BorderStyles.forgottextfieldBorder,
        ),
      ),
    );
  }
}
