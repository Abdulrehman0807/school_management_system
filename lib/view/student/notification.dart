import 'package:flutter/material.dart';
import 'package:school_management_system/model/notificationmodel.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      child: Stack(children: [
        Container(
          height: height * 0.293,
          width: width,
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: height * 0.15,
                width: width * 0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/logo1.png")),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: height * 0.7,
                    width: width * 0.9,
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: ModelClass.mylist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: height * 0.07,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black12)),
                            child: ListTile(
                              //   leading: CircleAvatar(
                              //     radius: 20,
                              //     child: Icon(
                              //       Icons.person,
                              //       color:
                              //           Theme.of(context).colorScheme.background,
                              //     ),
                              // ),
                              title: Text(
                                ModelClass.mylist[index].name!,
                              ),
                            ),
                          ),
                        );
                      },
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
              child: Text("Alert Notifications",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: width * 0.06,
                      )),
            ),
          ),
        ),
      ]),
    ));
  }
}
