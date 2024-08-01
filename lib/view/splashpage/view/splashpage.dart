import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/dashboard/view/dashboardpage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: FlutterSplashScreen.fadeIn(
        backgroundColor: Constants.white,
        childWidget: SizedBox(
          height: size.width * 0.8,
          width: size.width * 0.8,
          child: const Image(
            image: AssetImage('assets/logo/applogo.png'),
          ),
        ),
        onAnimationEnd: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const DashboardpageWrapper()),
          );
        },
      ),
    );
  }
}
