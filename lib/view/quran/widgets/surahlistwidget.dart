import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/quran/view/surahpage.dart';

class SurahListWidget extends StatelessWidget {
  const SurahListWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.num,
  });
  final String title;
  final String subtitle;
  final String num;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (_)=>SurahPageWrapper(title: title,index: num,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  num,
                  style: TextStyles.size20,
                ),
                Constants.width20,
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
              ],
            ),
            const Icon(
              Icons.bookmark_border,
              color: Constants.white,
            ),
          ],
        ),
      ),
    );
  }
}
