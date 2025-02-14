import 'package:flutter/material.dart';
import 'package:school_management_system/model/painter.dart';
import 'package:school_management_system/view/parents/signup_login/login.dart';

class parentsSignupScreen extends StatefulWidget {
  const parentsSignupScreen({super.key});

  @override
  State<parentsSignupScreen> createState() => _parentsSignupScreenState();
}

class _parentsSignupScreenState extends State<parentsSignupScreen>
    with TickerProviderStateMixin {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize AnimationController for multiple animations
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define tween animations
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: Offset(0, 0.5), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animations
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
        child: CustomPaint(
          painter: MyCustomPainter(),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height * 0.15),
                  // Logo with scaling animation
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      height: height * 0.18,
                      width: width * 0.42,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/logo1.png")),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Name input field with slide animation
                  SlideTransition(
                    position: _slideAnimation,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Enter a name",
                          labelStyle: TextStyle(fontSize: width * 0.05),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: width * 0.04, vertical: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.022),
                  // Student ID input field
                  SlideTransition(
                    position: _slideAnimation,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: TextFormField(
                        controller: _studentIdController,
                        decoration: InputDecoration(
                          labelText: "Parent ID",
                          hintText: "Enter a Parent ID",
                          labelStyle: TextStyle(fontSize: width * 0.05),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: width * 0.04, vertical: 15),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Parent ID';
                          }
                          if (value.length != 14) {
                            return 'Parent ID should be 14 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.022),
                  // Password input field
                  SlideTransition(
                    position: _slideAnimation,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter a Password",
                          labelStyle: TextStyle(fontSize: width * 0.05),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: width * 0.04, vertical: 15),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Row(
                    children: [
                      SizedBox(width: width * 0.05),
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
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.005),
                  // Sign Up button with scaling effect
                  AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => DashboardScreen(),
                                //   ),
                                // );
                              }
                            },
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "SIGN UP",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        fontStyle: FontStyle.italic,
                                        fontSize: width * 0.06,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  // Login link
                  Container(
                    height: height * 0.05,
                    width: width * 0.72,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontStyle: FontStyle.normal,
                                  fontSize: width * 0.043,
                                  fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ParentsLoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontStyle: FontStyle.italic,
                                    fontSize: width * 0.06,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
