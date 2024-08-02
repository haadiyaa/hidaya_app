import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/splashpage/view/splashpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: Size(size.width,size.height),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          textTheme: Typography.whiteCupertino,
          appBarTheme: const AppBarTheme(
            backgroundColor: Constants.greenDark,
            foregroundColor: Constants.white,
            centerTitle: true,
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: child,
      ),
      child:const SplashPage(),
    );
  }
}
