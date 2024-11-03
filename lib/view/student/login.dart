import 'package:flutter/material.dart';
import 'package:school_management_system/model/painter.dart';
import 'package:school_management_system/view/student/dashboard.dart';
import 'package:school_management_system/view/student/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var height, width;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();

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
              SizedBox(
                height: height * 0.2,
              ),
              // Text(
              //   "LOGIN",
              //   style: Theme.of(context).textTheme.headline1!.copyWith(
              //       fontStyle: FontStyle.normal,
              //       fontSize: width * 0.1,
              //       color: Colors.white,
              //       fontWeight: FontWeight.w800),
              // ),
              // SizedBox(
              //   height: height * 0.05,
              // ),
              Container(
                height: height * 0.15,
                width: width * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/logo1.png")),
                ),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                child: Card(
                    elevation: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Student ID",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: width * 0.03,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {},
                    )),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                child: Card(
                    elevation: 4,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: width * 0.03,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {},
                    )),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Container(
                height: height * 0.04,
                width: width * 0.86,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forget Password ?",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontStyle: FontStyle.normal,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => DashboardScreen())));
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontStyle: FontStyle.normal,
                            fontSize: width * 0.06,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Container(
                height: height * 0.06,
                width: width * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10), right: Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontStyle: FontStyle.normal,
                            fontSize: width * 0.043,
                            fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SignInScreen())));
                        },
                        child: Text(
                          "Sign Up",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontStyle: FontStyle.normal,
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
