
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/styles/borderstyles.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class CusomTextField extends StatelessWidget {
  const CusomTextField({
    super.key,
    required this.label,
    required this.controller,
     this.textInputType,
    this.validator,
  });
  final String label;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: TextFormField(
        style: TextStyles.textFieldStyle,
        validator: validator,
        // keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyles.loginLabelStyle,
          enabledBorder: BorderStyles.textfieldBorder,
          focusedBorder: BorderStyles.focusedBorder,
          focusedErrorBorder: BorderStyles.focusedBorder,
          errorBorder: BorderStyles.textfieldBorder,
        ),
      ),
    );
  }
}
