import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class DuaIndividualPageWrapper extends StatelessWidget {
  const DuaIndividualPageWrapper(
      {super.key, required this.title, required this.index});
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return DuaIndividualPage(
      title: title,
      index: index,
    );
  }
}

class DuaIndividualPage extends StatefulWidget {
  const DuaIndividualPage(
      {super.key, required this.title, required this.index});
  final String title;
  final int index;

  @override
  State<DuaIndividualPage> createState() => _DuaIndividualPageState();
}

class _DuaIndividualPageState extends State<DuaIndividualPage> {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(thickness: 0.5);
          },
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(
                  child: Text(
                    'kuytfdcghgfcfghjhgfg',
                    style: ArabicTextStyle(
                        arabicFont: ArabicFont.amiri,
                        fontSize: 25.sp,
                        height: 2.5),
                    textAlign: TextAlign.end,
                  ),
                ),
                Constants.height8,
                SizedBox(
                  child: Text(
                    'fghnbvcdfghvcx',
                    style: TextStyles.arabicTransFont,
                  ),
                ),
                Constants.height8,
                SizedBox(
                  child: Text(
                    'cvbnmjhgfghjkjhgf',
                    style: TextStyles.engFont,
                  ),
                ),
                Constants.height10,
              ],
            );
          },
        ),
      ),
    );
  }
}
