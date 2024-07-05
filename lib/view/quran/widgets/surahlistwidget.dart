
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class SurahListWidget extends StatelessWidget {
  const SurahListWidget({
    super.key, required this.title, required this.subtitle, required this.num,
  });
  final String title;
  final String subtitle;
  final String num;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          Text(
            num,
            style: TextStyles.size20,
          ),
          const Spacer(
            flex: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.prayerTodayStyle,
              ),
              Text(
                subtitle,
                style: TextStyles.qurantext,
              ),
            ],
          ),
          const Spacer(
            flex: 10,
          ),
          // const Icon(
          //   Icons.play_arrow_rounded,
          //   color: Constants.white,
          // ),
          // const Spacer(flex: 2,),
          const Icon(
            Icons.bookmark_border,
            color: Constants.white,
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}