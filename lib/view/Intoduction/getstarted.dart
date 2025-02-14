
import 'package:flutter/material.dart';
import 'package:school_management_system/view/select_method/select_login_meyhod.dart';

import 'package:school_management_system/model/painter.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> with TickerProviderStateMixin {
  // Declare animation controllers and animations
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with 2 seconds duration
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Scale animation (for button scaling)
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Fade-in animation (for logo and text opacity)
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Slide-up animation (for sliding text and button)
    _slideAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the controller when the widget is destroyed
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
        color: Colors.white,
        child: CustomPaint(
          painter: MyCustomPainter(),
          child: Column(
            children: [
              SizedBox(height: height * 0.2),
              // Animated logo with fade-in and slide-up effect
              FadeTransition(
                opacity: _opacityAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    height: height * 0.18,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/logo1.png")),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),

              // Animated text with fade-in effect
              FadeTransition(
                opacity: _opacityAnimation,
                child: Container(
                  height: height * 0.05,
                  width: width * 0.8,
                  child: Center(
                    child: Text(
                      "WELCOME TO THE NEXUS",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontStyle: FontStyle.normal,
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),

              // Animated description text with fade-in effect
              FadeTransition(
                opacity: _opacityAnimation,
                child: Container(
                  height: height * 0.25,
                  width: width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Bridging gaps, building futures – welcome to The Nexus School.",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontStyle: FontStyle.normal,
                              fontSize: width * 0.038,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        "At The Nexus School, every learner's journey is unique and valued.",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontStyle: FontStyle.normal,
                              fontSize: width * 0.038,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        "Where every student's potential is discovered, nurtured, and celebrated.",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontStyle: FontStyle.normal,
                              fontSize: width * 0.038,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),

              // Animated "Get Started" button with scaling effect
              AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value, // Apply scaling
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectedScreen(),
                              ));
                        },
                        child: Container(
                          height: height * 0.06,
                          width: width * 0.45,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontStyle: FontStyle.italic,
                                      fontSize: width * 0.065,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
