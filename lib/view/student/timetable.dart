import 'package:flutter/material.dart';

class Timetable extends StatefulWidget {
  const Timetable({super.key});

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> with TickerProviderStateMixin {
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
      child: Stack(
        children: [
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height * 0.54,
                      width: width * 0.88,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                height: height * 0.48,
                                width: width * 0.9,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black12,
                                    ),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Text("Timetable ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: width * 0.05,
                                              )),
                                      trailing: Icon(Icons.arrow_forward),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    ListTile(
                                      leading: Text("Monday ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: width * 0.04,
                                              )),
                                      trailing: Text("Feb 1, 2024",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: width * 0.04,
                                              )),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    ListTile(
                                      leading: Text("English ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: width * 0.037,
                                                  fontWeight: FontWeight.w500)),
                                      trailing: Container(
                                        height: height * 0.03,
                                        width: width * 0.22,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black12),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(" 12:00-12:40",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Text("Physic ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: width * 0.037,
                                                  fontWeight: FontWeight.w500)),
                                      trailing: Container(
                                        height: height * 0.03,
                                        width: width * 0.22,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black12),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(" 12:40-1:20",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Text("Chemistry ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: width * 0.037,
                                                  fontWeight: FontWeight.w500)),
                                      trailing: Container(
                                        height: height * 0.03,
                                        width: width * 0.22,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black12),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(" 1:20-2:00",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Text("Biology ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: width * 0.037,
                                                  fontWeight: FontWeight.w500)),
                                      trailing: Container(
                                        height: height * 0.03,
                                        width: width * 0.22,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black12),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(" 2:00-2:40",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          height: height * 0.48,
                          width: width * 0.88,
                          child: Center(
                            child: Container(
                              height: height * 0.48,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Text("Timetable ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.05,
                                            )),
                                    trailing: Icon(Icons.arrow_forward),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  ListTile(
                                    leading: Text("Tuesday ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.04,
                                            )),
                                    trailing: Text("Feb 8, 2024",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.04,
                                            )),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  ListTile(
                                    leading: Text("English ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 12:00-12:40",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Physic ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 12:40-1:20",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Chemistry ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 1:20-2:00",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Biology ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 2:00-2:40",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          height: height * 0.48,
                          width: width * 0.88,
                          child: Center(
                            child: Container(
                              height: height * 0.48,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Text("Timetable ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.05,
                                            )),
                                    trailing: Icon(Icons.arrow_forward),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  ListTile(
                                    leading: Text("Wednesday ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.04,
                                            )),
                                    trailing: Text("Feb 16, 2024",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.04,
                                            )),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  ListTile(
                                    leading: Text("English ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 12:00-12:40",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Physic ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 12:40-1:20",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Chemistry ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 1:20-2:00",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Biology ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 2:00-2:40",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          height: height * 0.48,
                          width: width * 0.88,
                          child: Center(
                            child: Container(
                              height: height * 0.48,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Text("Timetable ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.05,
                                            )),
                                    trailing: Icon(Icons.arrow_forward),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  ListTile(
                                    leading: Text("Thursday ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.04,
                                            )),
                                    trailing: Text("Feb 23, 2024",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.04,
                                            )),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  ListTile(
                                    leading: Text("English ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 12:00-12:40",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Physic ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 12:40-1:20",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Chemistry ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 1:20-2:00",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Biology ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 2:00-2:40",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          height: height * 0.48,
                          width: width * 0.88,
                          child: Center(
                            child: Container(
                              height: height * 0.48,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Text("Timetable ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.05,
                                            )),
                                    trailing: Icon(Icons.arrow_forward),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  ListTile(
                                    leading: Text("Friday ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.04,
                                            )),
                                    trailing: Text("Feb 23, 2024",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.04,
                                            )),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  ListTile(
                                    leading: Text("English ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 12:00-12:40",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Physic ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 12:40-1:20",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Chemistry ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 1:20-2:00",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Biology ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 2:00-2:40",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          height: height * 0.48,
                          width: width * 0.88,
                          child: Center(
                            child: Container(
                              height: height * 0.48,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Text("Timetable ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.05,
                                            )),
                                    trailing: Icon(Icons.arrow_forward),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  ListTile(
                                    leading: Text("Saturday ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.04,
                                            )),
                                    trailing: Text("Feb 28, 2024",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.04,
                                            )),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  ListTile(
                                    leading: Text("English ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 12:00-12:40",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Physic ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 12:40-1:20",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Chemistry ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 1:20-2:00",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text("Biology ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.037,
                                                fontWeight: FontWeight.w500)),
                                    trailing: Container(
                                      height: height * 0.03,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(" 2:00-2:40",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                child: Text("Timetable 2nd year / Fsc",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: width * 0.06,
                        )),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
