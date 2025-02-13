import 'package:flutter/material.dart';
import 'package:school_management_system/model/usermodel.dart';
import 'package:school_management_system/view/student/announcment.dart';
import 'package:school_management_system/view/student/accdmic_calendar.dart';
import 'package:school_management_system/view/student/attendance.dart';
import 'package:school_management_system/view/student/dailywork.dart';
import 'package:school_management_system/view/student/fee_bill.dart';
import 'package:school_management_system/view/student/notification.dart';
import 'package:school_management_system/view/student/profile.dart';
import 'package:school_management_system/view/student/result.dart';
import 'package:school_management_system/view/student/setting.dart';
import 'package:school_management_system/view/student/timetable.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,

        backgroundColor: Colors.blue,

        selectedItemColor: Colors.black, // Customize selected item color
        unselectedItemColor: Colors.grey, // Customize unselected item color
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 26, // Set unselected icon size here
            ),
            activeIcon: Icon(
              Icons.home,
              size: 30, // Set selected icon size here
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 26, // Set unselected icon size here
            ),
            activeIcon: Icon(
              Icons.person,
              size: 30, // Set selected icon size here
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
              size: 26, // Set unselected icon size here
            ),
            activeIcon: Icon(
              Icons.settings,
              size: 30, // Set selected icon size here
            ),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view,
              size: 26, // Set unselected icon size here
            ),
            activeIcon: Icon(
              Icons.grid_view_sharp,
              size: 30, // Set selected icon size here
            ),
            label: 'More',
          ),
        ],
        selectedLabelStyle: TextStyle(
          fontSize: 14, // Set selected label text size
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12, // Set unselected label text size
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
              height: height * 0.3,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                child: FadeTransition(
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
              ),
            ),
            Positioned(
              bottom: 0,
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Container(
                  height: height * 0.66,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: height * 0.08,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black12, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Theme.of(context).colorScheme.background,
                                child: Icon(Icons.person),
                              ),
                              title: Text("Abdulrehman",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        fontSize: width * 0.05,
                                      )),
                              trailing: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()));
                                },
                                child: Container(
                                  height: height * 0.04,
                                  width: width * 0.25,
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text("View Profile",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: width * 0.03,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: UserModel2.mylist.length * height * 0.17,
                          width: width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: UserModel2.mylist.map((item) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: height * 0.15,
                                  width: width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Timetable()));
                                        },
                                        child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Container(
                                            height: height * 0.15,
                                            width: width * 0.27,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: width * 0.002),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.schedule,
                                                  size: width * 0.11,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                                ),
                                                Text(
                                                  "Time Table",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1!
                                                      .copyWith(
                                                        fontSize: width * 0.032,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Attendance()));
                                        },
                                        child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Container(
                                            height: height * 0.15,
                                            width: width * 0.27,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: width * 0.002),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.description,
                                                  size: width * 0.11,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                                ),
                                                Text(
                                                  "Attendance",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1!
                                                      .copyWith(
                                                        fontSize: width * 0.032,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Announcments()));
                                        },
                                        child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Container(
                                            height: height * 0.15,
                                            width: width * 0.27,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: width * 0.002),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.campaign,
                                                  size: width * 0.11,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                                ),
                                                Text(
                                                  "Announcment",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1!
                                                      .copyWith(
                                                        fontSize: width * 0.032,
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
                              );
                            }).toList(),
                          ),
                        )

                        //  GridView.count(
                        //     crossAxisCount: 3,
                        //     crossAxisSpacing: 8,
                        //     mainAxisSpacing: 8,
                        //     children: [
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => Timetable()));
                        //   },
                        //   child: Card(
                        //     elevation: 2,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(10)),
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           border: Border.all(
                        //               color: Colors.black12,
                        //               width: width * 0.002),
                        //           borderRadius:
                        //               BorderRadius.circular(10)),
                        //       child: Column(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.center,
                        //         children: [
                        //           Icon(
                        //             Icons.schedule,
                        //             size: width * 0.11,
                        //             color: Theme.of(context)
                        //                 .colorScheme
                        //                 .background,
                        //           ),
                        //           Text(
                        //             "Time Table",
                        //             style: Theme.of(context)
                        //                 .textTheme
                        //                 .headline1!
                        //                 .copyWith(
                        //                   fontSize: width * 0.032,
                        //                 ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        //       InkWell(
                        //         onTap: () {
                        //           Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => Dailywork()));
                        //         },
                        //         child: Card(
                        //           elevation: 2,
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(10)),
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 border: Border.all(
                        //                     color: Colors.black12,
                        //                     width: width * 0.002),
                        //                 borderRadius:
                        //                     BorderRadius.circular(10)),
                        //             child: Column(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               children: [
                        //                 Icon(
                        //                   Icons.article,
                        //                   size: width * 0.11,
                        //                   color: Theme.of(context)
                        //                       .colorScheme
                        //                       .background,
                        //                 ),
                        //                 Text(
                        //                   "Daily Work",
                        //                   style: Theme.of(context)
                        //                       .textTheme
                        //                       .headline1!
                        //                       .copyWith(
                        //                         fontSize: width * 0.032,
                        //                       ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       Notifications()));
                        //         },
                        //         child: Card(
                        //           elevation: 2,
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(10)),
                        //           child: Container(
                        //             height: height * 0.17,
                        //             width: width * 0.3,
                        //             decoration: BoxDecoration(
                        //                 border: Border.all(
                        //                     color: Colors.black12,
                        //                     width: width * 0.002),
                        //                 borderRadius:
                        //                     BorderRadius.circular(10)),
                        //             child: Column(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               children: [
                        //                 Icon(
                        //                   Icons.notifications,
                        //                   size: width * 0.11,
                        //                   color: Theme.of(context)
                        //                       .colorScheme
                        //                       .background,
                        //                 ),
                        //                 Text(
                        //                   "Notifications",
                        //                   style: Theme.of(context)
                        //                       .textTheme
                        //                       .headline1!
                        //                       .copyWith(
                        //                         fontSize: width * 0.032,
                        //                       ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       Resultscreen()));
                        //         },
                        //         child: Card(
                        //           elevation: 2,
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(10)),
                        //           child: Container(
                        //             height: height * 0.17,
                        //             width: width * 0.3,
                        //             decoration: BoxDecoration(
                        //                 border: Border.all(
                        //                     color: Colors.black12,
                        //                     width: width * 0.002),
                        //                 borderRadius:
                        //                     BorderRadius.circular(10)),
                        //             child: Column(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               children: [
                        //                 Icon(
                        //                   Icons.assessment,
                        //                   size: width * 0.11,
                        //                   color: Theme.of(context)
                        //                       .colorScheme
                        //                       .background,
                        //                 ),
                        //                 Text(
                        //                   "Results",
                        //                   style: Theme.of(context)
                        //                       .textTheme
                        //                       .headline1!
                        //                       .copyWith(
                        //                         fontSize: width * 0.032,
                        //                       ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => Fee_Bill()));
                        //         },
                        //         child: Card(
                        //           elevation: 2,
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(10)),
                        //           child: Container(
                        //             height: height * 0.17,
                        //             width: width * 0.3,
                        //             decoration: BoxDecoration(
                        //                 border: Border.all(
                        //                     color: Colors.black12,
                        //                     width: width * 0.002),
                        //                 borderRadius:
                        //                     BorderRadius.circular(10)),
                        //             child: Column(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               children: [
                        //                 Icon(
                        //                   Icons.payment,
                        //                   size: width * 0.11,
                        //                   color: Theme.of(context)
                        //                       .colorScheme
                        //                       .background,
                        //                 ),
                        //                 Text(
                        //                   "Fee Voucher",
                        //                   style: Theme.of(context)
                        //                       .textTheme
                        //                       .headline1!
                        //                       .copyWith(
                        //                         fontSize: width * 0.032,
                        //                       ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       CalendarScreen()));
                        //         },
                        //         child: Card(
                        //           elevation: 2,
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(10)),
                        //           child: Container(
                        //             height: height * 0.17,
                        //             width: width * 0.3,
                        //             decoration: BoxDecoration(
                        //                 border: Border.all(
                        //                     color: Colors.black12,
                        //                     width: width * 0.002),
                        //                 borderRadius:
                        //                     BorderRadius.circular(10)),
                        //             child: Column(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               children: [
                        //                 Icon(
                        //                   Icons.calendar_month,
                        //                   size: width * 0.11,
                        //                   color: Theme.of(context)
                        //                       .colorScheme
                        //                       .background,
                        //                 ),
                        //                 Text(
                        //                   "Calendar",
                        //                   style: Theme.of(context)
                        //                       .textTheme
                        //                       .headline1!
                        //                       .copyWith(
                        //                         fontSize: width * 0.032,
                        //                       ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       SettingScreen()));
                        //         },
                        //         child: Card(
                        //           elevation: 2,
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(10)),
                        //           child: Container(
                        //             height: height * 0.17,
                        //             width: width * 0.3,
                        //             decoration: BoxDecoration(
                        //                 border: Border.all(
                        //                     color: Colors.black12,
                        //                     width: width * 0.002),
                        //                 borderRadius:
                        //                     BorderRadius.circular(10)),
                        //             child: Column(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               children: [
                        //                 Icon(
                        //                   Icons.settings,
                        //                   size: width * 0.11,
                        //                   color: Theme.of(context)
                        //                       .colorScheme
                        //                       .background,
                        //                 ),
                        //                 Text(
                        //                   "Setting",
                        //                   style: Theme.of(context)
                        //                       .textTheme
                        //                       .headline1!
                        //                       .copyWith(
                        //                         fontSize: width * 0.032,
                        //                       ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       )
                        //     ]),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
