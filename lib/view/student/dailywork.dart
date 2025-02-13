import 'package:flutter/material.dart';

class Dailywork extends StatefulWidget {
  const Dailywork({super.key});

  @override
  State<Dailywork> createState() => _DailyworkState();
}

class _DailyworkState extends State<Dailywork> with TickerProviderStateMixin {
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
            color: Colors.white,
            child: Stack(children: [
              Container(
                height: height * 0.3,
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
                        children: [
                          SizedBox(
                            height: height * 0.06,
                          ),
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Card(
                              elevation: 1,
                              child: Container(
                                height: height * 0.413,
                                width: width * 0.9,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black12, width: 1)),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * 0.06,
                                      width: width,
                                      color: Colors.yellow,
                                      child: Center(
                                        child: Text("Home Work",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.05,
                                                )),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Types",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.04,
                                                  )),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Text("Title",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.04,
                                                  )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Math",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.034,
                                                  )),
                                          Text("Perpared",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.034,
                                                  )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.black12,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("English",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                          Text("Perpared",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Urdu",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                          Text("Perpared",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.black12,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Biology",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.034,
                                                  )),
                                          Text("Perpared",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.034,
                                                  )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Physic",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                          Text("Perpared",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.black12,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Pak Study",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                          Text("Perpared",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Card(
                              elevation: 1,
                              child: Container(
                                height: height * 0.413,
                                width: width * 0.9,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black12, width: 1)),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * 0.06,
                                      width: width,
                                      color: Colors.yellow,
                                      child: Center(
                                        child: Text("Tests",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.05,
                                                )),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Types",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.04,
                                                  )),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Text("Title",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.04,
                                                  )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Test 1",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.035,
                                                  )),
                                          Text("(Reading comperhension)",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.03,
                                                  )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.black12,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Test 2",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.035,
                                                  )),
                                          Text("(Reading comperhension)",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.03,
                                                  )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Test 3",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.035,
                                                  )),
                                          Text("(Reading comperhension)",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.03,
                                                  )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.black12,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Test 4",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.035,
                                                  )),
                                          Text("(Reading comperhension)",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.03,
                                                  )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Test 5",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.035,
                                                  )),
                                          Text("(Reading comperhension)",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.03,
                                                  )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.black12,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Test 6",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.035,
                                                  )),
                                          Text("(Reading comperhension)",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.03,
                                                  )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Card(
                              elevation: 1,
                              child: Container(
                                height: height * 0.413,
                                width: width * 0.9,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black12, width: 1)),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * 0.06,
                                      width: width,
                                      color: Colors.yellow,
                                      child: Center(
                                        child: Text("Class Work",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.05,
                                                )),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Types",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.04,
                                                  )),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Text("Title",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.04,
                                                  )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Lecture",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.04,
                                                  )),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Text("Lecture-01",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.04,
                                                  )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.black12,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Discussion",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                          Text("Discussion-Test 1",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Discussion",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                          Text("Discussion-Test 2",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.black12,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Discussion",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.034,
                                                  )),
                                          Text("Discussion-Test 3",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: width * 0.034,
                                                  )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Discussion",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                          Text("Discussion-Test 4",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width,
                                      color: Colors.black12,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Discussion",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                          Text("Discussion-Test 5",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.034)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
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
                child: Container(
                  height: height * 0.08,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text("Daily Work",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: width * 0.06,
                            )),
                  ),
                ),
              ),
            ])));
  }
}
