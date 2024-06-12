
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class GradientContainerContent extends StatelessWidget {
  const GradientContainerContent({
    super.key, this.subtitle, required this.title, this.icon,
  });
  final String? subtitle;
  final String title;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subtitle!=null?Text(subtitle!,style: TextStyles.gradContainerSubTextStyle,):const SizedBox(),
        Text(
          title,
          style: TextStyles.gradContainerTextStyle,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if(icon!=null)icon!
            ],
          ),
        ),
      ],
    );
  }
}
