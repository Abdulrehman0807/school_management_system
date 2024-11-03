import 'package:flutter/material.dart';
import 'package:school_management_system/model/painter.dart';
import 'package:school_management_system/view/student/dashboard.dart';
import 'package:school_management_system/view/student/login.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var height, width;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();
  TextEditingController _namecontroller = new TextEditingController();

  bool isChecked = false;
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
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                height: height * 0.02,
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
                        labelText: "Name",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: width * 0.03),
                      ),
                    )),
              ),
              SizedBox(
                height: height * 0.01,
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: width * 0.03),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {},
                    )),
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text(
                    "Remember me",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: width * 0.04, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Card(
                elevation: 4,
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
                        "SIGN UP",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontStyle: FontStyle.normal,
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.05,
                width: width * 0.72,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Already have a account ?  ",
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
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontStyle: FontStyle.normal,
                                  fontSize: width * 0.06,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: height * 0.015,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
