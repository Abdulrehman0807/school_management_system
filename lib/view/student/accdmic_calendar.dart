import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<Event>> _events = {
    DateTime.utc(2024, 1, 1): [Event('New Year Holiday')],
    DateTime.utc(2024, 11, 10): [Event('Mid-Semester Exams Start')],
    DateTime.utc(2024, 11, 17): [Event('Mid-Semester Break')],
    DateTime.utc(2024, 6, 10): [Event('End-of-Semester Exams')],
    DateTime.utc(2024, 6, 20): [Event('Summer Vacation Starts')],
    DateTime.utc(2024, 9, 5): [Event('New Semester Begins')],
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

    // Initialize the selected day and selected events notifier
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _controller.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
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
                          height: height * 0.06,
                        ),
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
                                  border: Border.all(color: Colors.black12)),
                              child: Column(
                                children: [
                                  TableCalendar<Event>(
                                    firstDay: DateTime.utc(2023, 12, 31),
                                    lastDay: DateTime.utc(2024, 12, 31),
                                    focusedDay: _focusedDay,
                                    calendarFormat: _calendarFormat,
                                    selectedDayPredicate: (day) =>
                                        isSameDay(_selectedDay, day),
                                    eventLoader: _getEventsForDay,
                                    onDaySelected: (selectedDay, focusedDay) {
                                      if (!isSameDay(
                                          _selectedDay, selectedDay)) {
                                        setState(() {
                                          _selectedDay = selectedDay;
                                          _focusedDay = focusedDay;
                                          _selectedEvents.value =
                                              _getEventsForDay(selectedDay);
                                        });
                                      }
                                    },
                                    onPageChanged: (focusedDay) {
                                      _focusedDay = focusedDay;
                                    },
                                    calendarStyle: CalendarStyle(
                                      todayDecoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        shape: BoxShape.circle,
                                      ),
                                      selectedDecoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        shape: BoxShape.circle,
                                      ),
                                      markerDecoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      markersMaxCount: 1,
                                    ),
                                    headerStyle: HeaderStyle(
                                      formatButtonVisible: false,
                                      titleCentered: true,
                                    ),
                                  ),
                                  const SizedBox(height: 1.0),
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
                    child: Text("Academic Calendar",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: width * 0.06,
                            )),
                  ),
                ),
              ),
            ])));
  }
}
