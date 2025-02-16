import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class Event {
  final String title;
  Event(this.title);

  @override
  String toString() => title;
}

class _CalendarScreenState extends State<CalendarScreen>
    with TickerProviderStateMixin {
  late final ValueNotifier<List<Event>> _selectedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final List<Appointment> _appointments = [
    // 2025 Appointments
    Appointment(
      startTime: DateTime.utc(2025, 1, 1),
      endTime: DateTime.utc(2025, 1, 1, 1),
      subject: 'New Year Holiday',
      color: Colors.green,
    ),
    Appointment(
      startTime: DateTime.utc(2025, 1, 10),
      endTime: DateTime.utc(2025, 1, 10, 1),
      subject: 'Mid-Semester Exams Start',
      color: Colors.red,
    ),
    Appointment(
      startTime: DateTime.utc(2025, 1, 17),
      endTime: DateTime.utc(2025, 1, 17, 1),
      subject: 'Mid-Semester Break',
      color: Colors.blue,
    ),
    Appointment(
      startTime: DateTime.utc(2025, 6, 10),
      endTime: DateTime.utc(2025, 6, 10, 1),
      subject: 'End-of-Semester Exams',
      color: Colors.orange,
    ),
    Appointment(
      startTime: DateTime.utc(2025, 6, 20),
      endTime: DateTime.utc(2025, 6, 20, 1),
      subject: 'Summer Vacation Starts',
      color: Colors.purple,
    ),
    Appointment(
      startTime: DateTime.utc(2025, 9, 5),
      endTime: DateTime.utc(2025, 9, 5, 1),
      subject: 'New Semester Begins',
      color: Colors.yellow,
    ),
    // Additional 2025 appointments
    Appointment(
      startTime: DateTime.utc(2025, 3, 25),
      endTime: DateTime.utc(2025, 3, 25, 1),
      subject: 'Spring Break Starts',
      color: Colors.cyan,
    ),
    Appointment(
      startTime: DateTime.utc(2025, 4, 1),
      endTime: DateTime.utc(2025, 4, 1, 1),
      subject: 'April Fool\'s Day',
      color: Colors.pink,
    ),
    Appointment(
      startTime: DateTime.utc(2025, 12, 25),
      endTime: DateTime.utc(2025, 12, 25, 1),
      subject: 'Christmas Holiday',
      color: Colors.redAccent,
    ),
    Appointment(
      startTime: DateTime.utc(2025, 12, 31),
      endTime: DateTime.utc(2025, 12, 31, 1),
      subject: 'New Year\'s Eve',
      color: Colors.greenAccent,
    ),
  ];

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

    // Initialize the selected day
    _selectedDay = _focusedDay;

    // Initialize the selected events list
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _controller.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  // Get events for the selected day
  List<Event> _getEventsForDay(DateTime day) {
    return _appointments
        .where((appointment) =>
            appointment.startTime.year == day.year &&
            appointment.startTime.month == day.month &&
            appointment.startTime.day == day.day)
        .map((appointment) => Event(appointment.subject))
        .toList();
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
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      height: height * 0.15,
                      width: width * 0.7,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/logo1.png"),
                        ),
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
                child: Column(
                  children: [
                    SizedBox(height: height * 0.06),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: height * 0.6,
                          width: width * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: height * 0.55,
                                child: SfCalendar(
                                  view: CalendarView.month,
                                  firstDayOfWeek: 1,
                                  initialDisplayDate: _focusedDay,
                                  onTap: (details) {
                                    setState(() {
                                      _selectedDay = details.date!;
                                      _selectedEvents.value =
                                          _getEventsForDay(_selectedDay!);
                                    });
                                  },
                                  dataSource: EventDataSource(_appointments),
                                  monthViewSettings: MonthViewSettings(
                                    showAgenda: true,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              Expanded(
                                child: ValueListenableBuilder<List<Event>>(
                                  valueListenable: _selectedEvents,
                                  builder: (context, value, _) {
                                    return ListView.builder(
                                      itemCount: value.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(value[index].title),
                                        );
                                      },
                                    );
                                  },
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
                            "Academic Calendar",
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

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Appointment> source) {
    appointments = source;
  }
}
