// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hidhayah/utils/constants/constants.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    super.key,
    required this.text,
    this.bgcolor = Constants.greenDark2,
    this.fgcolor = Constants.white,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;
  final Color bgcolor;
  final Color fgcolor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: bgcolor,
        foregroundColor: fgcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: const BorderSide(color: Constants.greenDark, width: 2),
      ),
      child: Text(text),
    );
  }
}
