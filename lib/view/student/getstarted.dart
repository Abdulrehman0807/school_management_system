import 'package:flutter/material.dart';
import 'package:school_management_system/model/painter.dart';
import 'package:school_management_system/view/student/login.dart';
import 'package:school_management_system/view/student/signup.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  var height, width;
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
              SizedBox(
                height: height * 0.2,
              ),
              Container(
                height: height * 0.15,
                width: width * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/logo1.png")),
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              Container(
                height: height * 0.05,
                width: width * 0.8,
                child: Center(
                  child: Text(
                    "WELLCOME  THE NEXUS",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontStyle: FontStyle.normal,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.2,
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
              SizedBox(
                height: height * 0.02,
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ));
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontStyle: FontStyle.normal,
                            fontSize: width * 0.065,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.05,
                width: width * 0.6,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Have a account ?",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontStyle: FontStyle.normal,
                              fontSize: width * 0.048,
                            ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Login ",
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontStyle: FontStyle.normal,
                                    fontSize: width * 0.06,
                                  ),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
