import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/model/surahmodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class SurahAyatWidget extends StatelessWidget {
  const SurahAyatWidget({
    super.key,
    required this.surahModel,
    required this.size,
    required this.index,
  });

  final SurahModel surahModel;
  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Constants.greenLight)),
              child: Text('${surahModel.data!.verses![index].number!.inSurah}'),
            ),
          ],
        ),
        Constants.height8,
        Constants.width8,
        SizedBox(
          width: size.width * 0.9,
          child: Text(
            surahModel.data!.verses![index].text!.arab!,
            style:  ArabicTextStyle(arabicFont: ArabicFont.amiri,fontSize: 25.sp,height: 2.5),
            textAlign: TextAlign.end,
          ),
        ),
        Constants.height8,
        SizedBox(
          width: size.width * 0.9,
          child: Text(
            surahModel.data!.verses![index].text!.transliteration!.en!,
            style: TextStyles.arabicTransFont,
          ),
        ),
        Constants.height8,
        SizedBox(
          width: size.width * 0.9,
          child: Text(
            surahModel.data!.verses![index].translation!.en!,
            style: TextStyles.engFont,
          ),
        ),
        Constants.height10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
             Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                  ),
                  color: Constants.white,
                ),
                Constants.width8,
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                  ),
                  color: Constants.white,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
