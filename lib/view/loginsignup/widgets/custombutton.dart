
import 'package:flutter/material.dart';
import 'package:hidhayah/main.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.size, this.onPressed, required this.text,
  }) ;

  final Size size;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(size.width*0.7, 50),
        elevation: 5,
        backgroundColor: Constants.greenDark,
        foregroundColor: const Color.fromARGB(255, 238, 250, 244),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
