import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class PolicyWidget extends StatelessWidget {
  const PolicyWidget({
    super.key,
    required this.title,
    required this.desc,
  });
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyles.size20,
          ),
          Constants.height8,
          Text(
            desc,
            style: TextStyles.size18,
          ),
          Constants.height10,
        ],
      ),
    );
  }
}
