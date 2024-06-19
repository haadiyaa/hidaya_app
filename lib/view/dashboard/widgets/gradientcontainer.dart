
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    required this.size,
    this.gradient,
    required this.child,
  });

  final Size size;
  final Gradient? gradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        padding: Constants.gradContainPadd,
        height: size.height * 0.13,
        width: size.width * 0.39,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), gradient: gradient),
        child: child,
      ),
    );
  }
}