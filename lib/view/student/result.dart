import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Resultscreen extends StatefulWidget {
  const Resultscreen({super.key});

  @override
  State<Resultscreen> createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen>
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
                            child: Container(
                              height: height * 0.3,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.black12, width: 1)),
                              child: new CircularPercentIndicator(
                                radius: 70.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: 0.7,
                                center: new Text(
                                  "70.0%",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                footer: new Text(
                                  "This Month Result",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Card(
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
                                      child: Text("Monthly Result",
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
                                        Text("Subject",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.04,
                                                )),
                                        Text("Marks",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.04,
                                                )),
                                        Text("Total",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.04,
                                                )),
                                        Text("Percentage",
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
                                        Text("  80",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("100",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("       80.0 %",
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
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("60",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("100",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("       60.0 %",
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
                                        Text("Urdu ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("   70",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("100",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("       70.0 %",
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
                                        Text("Bio ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("     50",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("100",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("       50.0 %",
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
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("80",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("100",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.034,
                                                )),
                                        Text("       80.0 %",
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
                                        Text("Pass   ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.037,
                                                )),
                                        Text("340",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.037,
                                                )),
                                        Text("500",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.037,
                                                )),
                                        Text("       70.0 %",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.037,
                                                )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          )
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
                    child: Text("Result",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: width * 0.06,
                            )),
                  ),
                ),
              ),
            ])));
  }
}
