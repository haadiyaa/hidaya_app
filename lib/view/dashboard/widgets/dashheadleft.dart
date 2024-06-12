import 'package:flutter/material.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/common/widgets/customtext.dart';

class DashHeadLeft extends StatelessWidget {
  const DashHeadLeft({
    super.key,
    required this.salah,
  });

  final String salah;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: salah,
          style: TextStyles.dashboardHeadSalatStyle,
        ),
        Row(
          children: [
            CustomText(
              text: 'View Time',
              style: TextStyles.dashboardHeadViewStyle,
            ),
          ],
        ),
        CustomText(
          text: 'Now',
          style: TextStyles.dashboardHeadNowStyle,
        ),
      ],
    );
  }
}
