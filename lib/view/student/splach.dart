import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/view/student/getstarted.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AnimatedSplashScreen(
      backgroundColor: Colors.blue,
      splash: Image.asset(
        "images/logo1.png",
        width: width * 0.35,
        height: height * 0.35,
      ),
      splashIconSize: width * 0.3,
      duration: 500,
      splashTransition: SplashTransition.rotationTransition,
      // pageTransitionType: PageTransitionType.fade,
      nextScreen: GetStarted(),
    );
  }
}
