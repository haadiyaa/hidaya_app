import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/routes/approuteconfig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MyAppRouter myAppRouter = MyAppRouter();
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: myAppRouter.router,
        // routeInformationParser: myAppRouter.router.routeInformationParser,
        // routerDelegate: myAppRouter.router.routerDelegate,
        theme: ThemeData(textTheme: Typography.whiteCupertino),
        debugShowCheckedModeBanner: false,
        // home: child,
      ),
      // child:const DashBoardPage(),
    );
  }
}
