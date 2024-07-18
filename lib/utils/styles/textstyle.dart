import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/utils/constants/constants.dart';

class TextStyles {
  //=========================dashboard===============================================
  static TextStyle dashboardHeadStyle = TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900, );
  static TextStyle dashboardHeadSalatStyle = TextStyle( fontSize: 18.sp);
  static TextStyle dashboardHeadViewStyle = TextStyle(fontSize: 22.sp);
  static TextStyle dashboardHeadNowStyle = TextStyle(fontSize: 14.sp);

  //gradientcontainertext
  static TextStyle gradContainerTextStyle = TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold);
  static TextStyle gradContainerSubTextStyle = TextStyle(fontSize: 18.sp,fontWeight: FontWeight.normal);

  //====================Label text=====================================
  static  TextStyle loginLabelStyle =  TextStyle(color: Constants.greenDark,fontSize: 16.sp);
  static const TextStyle forgotLabelStyle =  TextStyle(color: Constants.white);

  //===================login style===================================
  static const TextStyle forgotPasStyle =  TextStyle(color: Constants.black,fontWeight: FontWeight.w300);
  static TextStyle textFieldStyle =  TextStyle(color: Constants.black,fontWeight: FontWeight.bold,fontSize: 16.sp);
  static const TextStyle forgottextFieldStyle =  TextStyle(color: Constants.white,fontWeight: FontWeight.bold);
  static const TextStyle loginfooterStyle =  TextStyle(fontWeight: FontWeight.w300);

  //================================tasbihpage=====================================
  static const TextStyle tasbihButtonStyle =  TextStyle(fontWeight: FontWeight.bold);
  static  TextStyle tasbihCounterStyle =  TextStyle(fontWeight: FontWeight.w600,fontSize: 40.sp);

  //=====================================prayertime=====================================
  static TextStyle prayerTodayStyle = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, );
  static TextStyle qurantext = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, );

  static TextStyle size20=TextStyle(fontSize: 20.sp);
  static TextStyle size18=TextStyle(fontSize: 18.sp);
  static TextStyle size18thin=TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w300);
  static TextStyle size16thin=TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w300);
  static const TextStyle bold=TextStyle(fontWeight:FontWeight.bold);
  static TextStyle boldHead=TextStyle(fontWeight:FontWeight.bold,fontSize: 20.sp);
  static const TextStyle thin=TextStyle(fontWeight:FontWeight.w300);

  //====================================quran page========================
  static TextStyle arabicTransFont=TextStyle(fontStyle: FontStyle.italic,color: Constants.greenLight,fontSize: 16.sp);
  static TextStyle engFont=TextStyle(fontSize: 18.sp);
  static TextStyle arabicFont=TextStyle(fontSize: 20.sp);

}
