import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.06,
                      ),
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Container(
                          height: height * 0.55,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text("Edit Profile",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                trailing: Icon(Icons.keyboard_arrow_down,
                                    size: width * 0.07, color: Colors.black),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                title: Text("Change Password",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                trailing: Icon(Icons.keyboard_arrow_down,
                                    size: width * 0.07, color: Colors.black),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                title: Text("Change Email",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                trailing: Icon(Icons.keyboard_arrow_down,
                                    size: width * 0.07, color: Colors.black),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                title: Text("Theme",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                trailing: Icon(Icons.toggle_off,
                                    size: width * 0.1, color: Colors.black),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                title: Text("Notification",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                trailing: Icon(Icons.toggle_off,
                                    size: width * 0.1, color: Colors.black),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Container(
                                height: height * 0.05,
                                width: width * 0.25,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text("Logout",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal,
                                          )),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
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
                  child: Text("Setting",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: width * 0.05,
                          )),
                ),
              ),
            )
          ])),
    );
  }
}
