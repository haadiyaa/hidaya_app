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
    return Scaffold(
      backgroundColor: Colors.white,
      body: FlutterSplashScreen.fadeIn(
        backgroundColor: Constants.white,
        childWidget: const SizedBox(
          height: 200,
          width: 200,
          child: Image(
            image: AssetImage('assets/logo/applogo.jpg'),
          ),
          
        ),
        onAnimationEnd: () {
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const DashboardpageWrapper()));
        },
      ),
    );
  }
}
