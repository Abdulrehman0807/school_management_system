import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> with TickerProviderStateMixin {
  DateTime _selectedDate = DateTime.now();

  final Map<DateTime, String> _attendance = {
    // 2024 Attendance Data
    DateTime.utc(2024, 9, 1): 'P',
    DateTime.utc(2024, 9, 2): 'A',
    DateTime.utc(2024, 9, 3): 'P',
    DateTime.utc(2024, 9, 4): 'L',
    DateTime.utc(2024, 9, 5): 'P',
    DateTime.utc(2024, 9, 6): 'A',
    DateTime.utc(2024, 9, 7): 'P',
    DateTime.utc(2024, 9, 8): 'P',

    // 2025 Attendance Data
    DateTime.utc(2025, 1, 1): 'L', // New Year Holiday
    DateTime.utc(2025, 1, 2): 'P',
    DateTime.utc(2025, 1, 3): 'P',
    DateTime.utc(2025, 1, 4): 'A',
    DateTime.utc(2025, 1, 5): 'P',
    DateTime.utc(2025, 1, 6): 'P',
    DateTime.utc(2025, 1, 7): 'L', // Day off after New Year
    DateTime.utc(2025, 1, 8): 'P',
    DateTime.utc(2025, 1, 9): 'A',
    DateTime.utc(2025, 1, 10): 'P', // Mid-Semester Exams Start
    DateTime.utc(2025, 1, 11): 'P',
    DateTime.utc(2025, 1, 12): 'A',
    DateTime.utc(2025, 1, 13): 'P',
    DateTime.utc(2025, 1, 14): 'P',
    DateTime.utc(2025, 1, 15): 'A',
    DateTime.utc(2025, 1, 16): 'P',
    DateTime.utc(2025, 1, 17): 'L', // Mid-Semester Break
    DateTime.utc(2025, 1, 18): 'L',
    DateTime.utc(2025, 1, 19): 'P',
    DateTime.utc(2025, 1, 20): 'P',
    DateTime.utc(2025, 6, 10): 'P', // End-of-Semester Exams
    DateTime.utc(2025, 6, 11): 'A',
    DateTime.utc(2025, 6, 12): 'P',
    DateTime.utc(2025, 6, 13): 'P',
    DateTime.utc(2025, 6, 14): 'L', // Start of Summer Vacation
    DateTime.utc(2025, 6, 15): 'L',
    DateTime.utc(2025, 9, 5): 'P', // New Semester Begins
    DateTime.utc(2025, 9, 6): 'A',
    DateTime.utc(2025, 9, 7): 'P',
    DateTime.utc(2025, 9, 8): 'P',
    DateTime.utc(2025, 12, 25): 'L', // Christmas Holiday
    DateTime.utc(2025, 12, 26): 'P',
    DateTime.utc(2025, 12, 27): 'P',
    DateTime.utc(2025, 12, 28): 'A',
    DateTime.utc(2025, 12, 29): 'P',
    DateTime.utc(2025, 12, 30): 'A',
    DateTime.utc(2025, 12, 31): 'L', // New Year's Eve
  };

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
                        image: AssetImage("images/logo1.png"),
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
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.05),
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 2,
                          child: Container(
                            height: height * 0.55,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: height * 0.05,
                                  width: width * 0.35,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "October ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                            fontSize: width * 0.05,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.3,
                                  width: width * 0.7,
                                  child: CircularPercentIndicator(
                                    radius: 100.0,
                                    animation: true,
                                    animationDuration: 1200,
                                    lineWidth: 15.0,
                                    percent: 0.4,
                                    center: Text(
                                      "60.0 %",
                                      style: TextStyle(
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
                                    border: Border.all(color: Colors.black12),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "September ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.04,
                                            ),
                                      ),
                                      SizedBox(width: width * 0.42),
                                      Icon(
                                        Icons.chevron_right,
                                        size: width * 0.07,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: height * 0.05,
                                  width: width * 0.8,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Augest ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: width * 0.04,
                                            ),
                                      ),
                                      SizedBox(width: width * 0.42),
                                      Icon(
                                        Icons.chevron_right,
                                        size: width * 0.07,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 2,
                          child: Container(
                            height: height * 0.55,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(children: [
                              // Syncfusion Calendar
                              Container(
                                height: height * 0.52,
                                child: SfCalendar(
                                  view: CalendarView.month,
                                  initialSelectedDate: _selectedDate,
                                  onTap: (CalendarTapDetails details) {
                                    setState(() {
                                      _selectedDate = details.date!;
                                    });
                                  },
                                  monthViewSettings: MonthViewSettings(
                                    showAgenda: true,
                                  ),
                                  dataSource:
                                      _AttendanceDataSource(_attendance),
                                ),
                              ),
                              SizedBox(height: 1.0),
                              Expanded(
                                child: _attendance.containsKey(_selectedDate)
                                    ? Center(
                                        child: Text(
                                          'Attendance Status: ${_attendance[_selectedDate]}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      )
                                    : Center(
                                        child: Text(
                                          'No attendance record for this day',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                    ],
                  ),
                ),
              ),
            ),
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
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Attendance",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: width * 0.06,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom DataSource for Attendance
class _AttendanceDataSource extends CalendarDataSource {
  _AttendanceDataSource(Map<DateTime, String> attendance) {
    appointments = attendance.entries.map((entry) {
      return Appointment(
        startTime: entry.key,
        endTime: entry.key,
        subject: entry.value,
        color: _getColorForStatus(entry.value),
      );
    }).toList();
  }

  static Color _getColorForStatus(String status) {
    switch (status) {
      case 'P':
        return Colors.green; // Present
      case 'A':
        return Colors.red; // Absent
      case 'L':
        return Colors.orange; // Leave
      default:
        return Colors.transparent;
    }
  }
}
