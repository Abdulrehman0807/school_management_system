import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Sample data for attendance: Present (P), Absent (A), Leave (L)
  final Map<DateTime, String> _attendance = {
    DateTime.utc(2024, 9, 1): 'P',
    DateTime.utc(2024, 9, 2): 'A',
    DateTime.utc(2024, 9, 3): 'P',
    DateTime.utc(2024, 9, 4): 'L',
    DateTime.utc(2024, 9, 5): 'P',
    DateTime.utc(2024, 9, 6): 'A',
    DateTime.utc(2024, 9, 7): 'P',
    DateTime.utc(2024, 9, 8): 'P',
    // Add more data as needed
  };

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
                    Container(
                      height: height * 0.15,
                      width: width * 0.7,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/logo1.png")),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            elevation: 2,
                            child: Container(
                              height: height * 0.55,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: height * 0.05,
                                    width: width * 0.35,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text("October ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: width * 0.05,
                                              )),
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.3,
                                    width: width * 0.7,
                                    child: new CircularPercentIndicator(
                                      radius: 100.0,
                                      animation: true,
                                      animationDuration: 1200,
                                      lineWidth: 15.0,
                                      percent: 0.4,
                                      center: new Text(
                                        "60.0 %",
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width * 0.1),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: Colors.yellow,
                                      progressColor: Colors.red,
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.05,
                                    width: width * 0.8,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("September ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.04,
                                                )),
                                        SizedBox(
                                          width: width * 0.42,
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          size: width * 0.07,
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.05,
                                    width: width * 0.8,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Augest ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: width * 0.04,
                                                )),
                                        SizedBox(
                                          width: width * 0.42,
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          size: width * 0.07,
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 2,
                              child: Container(
                                height: height * 0.55,
                                width: width * 0.9,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    TableCalendar(
                                      firstDay: DateTime.utc(2024, 1, 1),
                                      lastDay: DateTime.utc(2024, 12, 31),
                                      focusedDay: _focusedDay,
                                      calendarFormat: _calendarFormat,
                                      selectedDayPredicate: (day) =>
                                          isSameDay(_selectedDay, day),
                                      onDaySelected: (selectedDay, focusedDay) {
                                        setState(() {
                                          _selectedDay = selectedDay;
                                          _focusedDay = focusedDay;
                                        });
                                      },
                                      onPageChanged: (focusedDay) {
                                        _focusedDay = focusedDay;
                                      },
                                      eventLoader: (day) {
                                        // Return attendance status for the day
                                        return _attendance.containsKey(day)
                                            ? [_attendance[day] ?? '']
                                            : [];
                                      },
                                      calendarBuilders: CalendarBuilders(
                                        markerBuilder: (context, day, events) {
                                          if (events.isEmpty) return null;

                                          // Different colors based on attendance status
                                          Color markerColor;
                                          if (events.contains('P')) {
                                            markerColor =
                                                Colors.green; // Present
                                          } else if (events.contains('A')) {
                                            markerColor = Colors.red; // Absent
                                          } else if (events.contains('L')) {
                                            markerColor =
                                                Colors.orange; // Leave
                                          } else {
                                            markerColor = Colors.transparent;
                                          }

                                          return Container(
                                            width: width * 0.02,
                                            height: height * 0.02,
                                            decoration: BoxDecoration(
                                              color: markerColor,
                                              shape: BoxShape.circle,
                                            ),
                                          );
                                        },
                                      ),
                                      calendarStyle: CalendarStyle(
                                        todayDecoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          shape: BoxShape.circle,
                                        ),
                                        selectedDecoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Expanded(
                                      child: _selectedDay != null &&
                                              _attendance
                                                  .containsKey(_selectedDay!)
                                          ? Center(
                                              child: Text(
                                                'Attendance Status: ${_attendance[_selectedDay!]}',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            )
                                          : Center(
                                              child: const Text(
                                                'No attendance record for this day',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: height * 0.03,
                          ),
                        ],
                      ),
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
                    child: Text("Attendance",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: width * 0.06,
                            )),
                  ),
                ),
              ),
            ])));
  }
}
