import 'package:flutter/material.dart';

class Announcments extends StatefulWidget {
  const Announcments({super.key});

  @override
  State<Announcments> createState() => _AnnouncmentsState();
}

class _AnnouncmentsState extends State<Announcments>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize AnimationController for multiple animations
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
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
            child: Stack(children: [
              Container(
                height: height * 0.293,
                width: width,
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        height: height * 0.15,
                        width: width * 0.7,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/logo1.png")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: height * 0.72,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: height * 0.06,
                          ),
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Container(
                              height: height * 0.55,
                              width: width * 0.85,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: height * 0.046,
                                    width: width * 0.85,
                                    color: Colors.yellow,
                                    child: Center(
                                      child: Text("Event Holiday  23 Mar 2024",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.5,
                                    width: width * 0.85,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "images/announcment.jpg")),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Container(
                              height: height * 0.55,
                              width: width * 0.85,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: height * 0.046,
                                    width: width * 0.85,
                                    color: Colors.yellow,
                                    child: Center(
                                      child: Text("Event Holiday  23 Mar 2024",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.5,
                                    width: width * 0.85,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "images/announcment.jpg")),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Container(
                              height: height * 0.55,
                              width: width * 0.85,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: height * 0.046,
                                    width: width * 0.85,
                                    color: Colors.yellow,
                                    child: Center(
                                      child: Text("Event Holiday  23 Mar 2024",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.5,
                                    width: width * 0.85,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black12, width: 1),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "images/announcment.jpg")),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  bottom: height * 0.68,
                  left: width * 0.1,
                  right: width * 0.1,
                  child: TweenAnimationBuilder(
                      duration: Duration(seconds: 1),
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.scale(
                            scale: value,
                            child: Container(
                              height: height * 0.08,
                              width: width * 0.8,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text("Announcments",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: width * 0.06,
                                        )),
                              ),
                            ),
                          ),
                        );
                      })),
            ])));
  }
}
