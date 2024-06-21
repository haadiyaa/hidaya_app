
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';

class CustomLightButton extends StatelessWidget {
  const CustomLightButton({
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
        backgroundColor: Constants.greenLight,
        foregroundColor:  Constants.greenDark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
