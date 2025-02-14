import 'package:flutter/material.dart';

class Fee_Bill extends StatefulWidget {
  const Fee_Bill({super.key});

  @override
  State<Fee_Bill> createState() => _Fee_BillState();
}

class _Fee_BillState extends State<Fee_Bill> with TickerProviderStateMixin {
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

  var index = 0;
  PageController controller = PageController();
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Container(
                          height: height * 0.67,
                          width: width * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: height * 0.05,
                                width: width * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.black12)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.jumpToPage(0);
                                      },
                                      child: Text("Paid",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: width * 0.04,
                                              )),
                                    ),
                                    Container(
                                      height: height * 0.04,
                                      width: width * 0.001,
                                      color: Colors.black,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.jumpToPage(1);
                                      },
                                      child: Text("Unpaid",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: width * 0.04,
                                              )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.6,
                                width: width * 0.9,
                                color: Colors.white,
                                child: PageView(
                                  controller: controller,
                                  physics: NeverScrollableScrollPhysics(),
                                  onPageChanged: (value) {
                                    value = index;
                                    setState(() {
                                      print(value);
                                    });
                                  },
                                  children: [
                                    Container(
                                      height: height * 0.6,
                                      width: width * 0.9,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            FadeTransition(
                                              opacity: _fadeAnimation,
                                              child: Card(
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Container(
                                                  height: height * 0.4,
                                                  width: width * 0.9,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black12,
                                                      ),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        height: height * 0.37,
                                                        width: width * 0.42,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("THE NEXUS",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .blue,
                                                                      fontSize:
                                                                          width *
                                                                              0.06,
                                                                    )),
                                                            Text("Education",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.06,
                                                                    )),
                                                            Text("Challan No.",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    )),
                                                            Text("123456789",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black26,
                                                                      fontSize:
                                                                          width *
                                                                              0.03,
                                                                    )),
                                                            Text("Concession",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    )),
                                                            Text("25 %",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black26,
                                                                      fontSize:
                                                                          width *
                                                                              0.03,
                                                                    )),
                                                            Text("Installment",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    )),
                                                            Text("1",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black26,
                                                                      fontSize:
                                                                          width *
                                                                              0.03,
                                                                    )),
                                                            Text("Due Date",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    )),
                                                            Text("12-9-2024",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black26,
                                                                      fontSize:
                                                                          width *
                                                                              0.03,
                                                                    )),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: height * 0.37,
                                                        width: width * 0.38,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                                  height * 0.04,
                                                            ),
                                                            Text("Paid Fee",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    )),
                                                            Text("5000/-",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black26,
                                                                      fontSize:
                                                                          width *
                                                                              0.05,
                                                                    )),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.2,
                                                            ),
                                                            Text("Recevie Date",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    )),
                                                            Text("10-9-2024",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black26,
                                                                      fontSize:
                                                                          width *
                                                                              0.03,
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
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Container(
                                                  height: height * 0.4,
                                                  width: width * 0.9,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black12,
                                                      ),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        height: height * 0.37,
                                                        width: width * 0.42,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("THE NEXUS",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .blue,
                                                                      fontSize:
                                                                          width *
                                                                              0.06,
                                                                    )),
                                                            Text("Education",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.06,
                                                                    )),
                                                            Text("Challan No.",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    )),
                                                            Text("123456789",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black26,
                                                                      fontSize:
                                                                          width *
                                                                              0.03,
                                                                    )),
                                                            Text("Concession",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    )),
                                                            Text("25 %",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black26,
                                                                      fontSize:
                                                                          width *
                                                                              0.03,
                                                                    )),
                                                            Text("Installment",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    )),
                                                            Text("2",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black26,
                                                                      fontSize:
                                                                          width *
                                                                              0.03,
                                                                    )),
                                                            Text("Due Date",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    )),
                                                            Text("12-9-2024",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black26,
                                                                      fontSize:
                                                                          width *
                                                                              0.03,
                                                                    )),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: height * 0.37,
                                                        width: width * 0.38,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                                  height * 0.04,
                                                            ),
                                                            Text("Paid Fee",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    )),
                                                            Text("5000/-",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black26,
                                                                      fontSize:
                                                                          width *
                                                                              0.05,
                                                                    )),
                                                            SizedBox(
                                                              height:
                                                                  height * 0.2,
                                                            ),
                                                            Text("Recevie Date",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    )),
                                                            Text("10-9-2024",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline1!
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black26,
                                                                      fontSize:
                                                                          width *
                                                                              0.03,
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
                                              height: height * 0.04,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.6,
                                      width: width * 0.9,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Card(
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Container(
                                                height: height * 0.4,
                                                width: width * 0.9,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black12,
                                                    ),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      height: height * 0.37,
                                                      width: width * 0.42,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("THE NEXUS",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontSize:
                                                                        width *
                                                                            0.06,
                                                                  )),
                                                          Text("Education",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        width *
                                                                            0.06,
                                                                  )),
                                                          Text("Challan No.",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                  )),
                                                          Text("123456789",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black26,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                  )),
                                                          Text("Concession",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                  )),
                                                          Text("25 %",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black26,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                  )),
                                                          Text("Installment",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                  )),
                                                          Text("1",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black26,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                  )),
                                                          Text("Due Date",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                  )),
                                                          Text("12-9-2024",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black26,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                  )),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: height * 0.37,
                                                      width: width * 0.38,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                height * 0.04,
                                                          ),
                                                          Text("UnPaid Fee",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                  )),
                                                          Text("5000/-",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black26,
                                                                    fontSize:
                                                                        width *
                                                                            0.05,
                                                                  )),
                                                          SizedBox(
                                                            height:
                                                                height * 0.2,
                                                          ),
                                                          Text("",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                  )),
                                                          Text("",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black12,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                  )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Card(
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Container(
                                                height: height * 0.4,
                                                width: width * 0.9,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black12,
                                                    ),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      height: height * 0.37,
                                                      width: width * 0.42,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("THE NEXUS",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontSize:
                                                                        width *
                                                                            0.06,
                                                                  )),
                                                          Text("Education",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        width *
                                                                            0.06,
                                                                  )),
                                                          Text("Challan No.",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                  )),
                                                          Text("123456789",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black26,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                  )),
                                                          Text("Concession",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                  )),
                                                          Text("25 %",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black26,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                  )),
                                                          Text("Installment",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                  )),
                                                          Text("2",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black26,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                  )),
                                                          Text("Due Date",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                  )),
                                                          Text("12-9-2024",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black26,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                  )),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: height * 0.37,
                                                      width: width * 0.38,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                height * 0.04,
                                                          ),
                                                          Text("UnPaid Fee",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                  )),
                                                          Text("5000/-",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black26,
                                                                    fontSize:
                                                                        width *
                                                                            0.05,
                                                                  )),
                                                          SizedBox(
                                                            height:
                                                                height * 0.2,
                                                          ),
                                                          Text("",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                  )),
                                                          Text("",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black12,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                  )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.04,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
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
                                child: Text("Fees Voucher",
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
