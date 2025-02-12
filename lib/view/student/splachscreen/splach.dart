import 'dart:async';
import 'package:flutter/material.dart';
import 'package:school_management_system/view/student/signup/getstarted.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
      value: 0.1,
    );
    animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic);
    controller.forward();

    // Navigate to the SignIn screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetStarted(), // Update this to your correct screen
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(),
        child: Center(
          child: ScaleTransition(
            scale: animation,
            alignment: Alignment.center,
            child: Container(
              height: height * 0.5,
              width: width * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "images/logo1.png"), // Ensure this path is correct
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
