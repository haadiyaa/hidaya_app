
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/common/widgets/customtext.dart';

class DashHeadRight extends StatelessWidget {
  const DashHeadRight({
    super.key, required this.date, required this.place,
  });

  final String date;
  final String place;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomText(
          text: date,
          style: TextStyles.dashboardHeadNowStyle,
        ),
        CustomText(
          text: place,
          style: TextStyles.dashboardHeadNowStyle,
        ),
      ],
    );
  }
}