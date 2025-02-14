import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
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
            height: height * 0.35,
            width: width,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: width * 0.1,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text("Mr. Abdulrehman",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: width * 0.06,
                        )),
                SizedBox(
                  height: height * 0.02,
                )
              ],
            ),
          ),
          Positioned(
              bottom: height * 0.61,
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
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            height: height * 0.09,
                            width: width * 0.8,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: height * 0.09,
                                  width: width * 0.25,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("DOB",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: width * 0.05,
                                              )),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        "12 Jan 2003",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: Colors.blue[600],
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: height * 0.09,
                                  width: width * 0.005,
                                  color: Colors.black,
                                ),
                                Container(
                                  height: height * 0.09,
                                  width: width * 0.25,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Class",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: width * 0.05,
                                              )),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        "12th / Fsc",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: Colors.blue[600],
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: height * 0.09,
                                  width: width * 0.005,
                                  color: Colors.black,
                                ),
                                Container(
                                  height: height * 0.09,
                                  width: width * 0.25,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Join Date",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: width * 0.05,
                                              )),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        "12 Mar 2022",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: Colors.blue[600],
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
          Positioned(
            bottom: height * 0.08,
            top: height * 0.4,
            left: width * 0.05,
            right: width * 0.05,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: height * 0.5,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black12)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.05,
                          width: width * 0.5,
                          child: Center(
                            child: Text("Personal Information",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: width * 0.047,
                                        fontWeight: FontWeight.w700)),
                          ),
                        ),
                        ListTile(
                          leading: Text("Student ID :",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: width * 0.038,
                                      fontWeight: FontWeight.w700)),
                          title: Text("F21BSEEN1M01074",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w700)),
                        ),
                        ListTile(
                          leading: Text("Father Name :",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: width * 0.038,
                                      fontWeight: FontWeight.w700)),
                          title: Text("M Iqbal",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w700)),
                        ),
                        ListTile(
                          leading: Text("Phone No :",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: width * 0.038,
                                      fontWeight: FontWeight.w700)),
                          title: Text("1234567890",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w700)),
                        ),
                        ListTile(
                          leading: Text("CNIC :",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: width * 0.038,
                                      fontWeight: FontWeight.w700)),
                          title: Text("1234576890",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w700)),
                        ),
                        ListTile(
                          leading: Text("Section :",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: width * 0.038,
                                      fontWeight: FontWeight.w700)),
                          title: Text("3M",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w700)),
                        ),
                        ListTile(
                          leading: Text("Address :",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: width * 0.038,
                                      fontWeight: FontWeight.w700)),
                          title: Text("Bahawalpur",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
