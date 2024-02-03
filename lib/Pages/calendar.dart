import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';

class Calendarr extends StatefulWidget {
  const Calendarr({super.key});

  @override
  State<Calendarr> createState() => _CalendarrState();
}

class _CalendarrState extends State<Calendarr> {
  final _calendarControllerToday = AdvancedCalendarController.today();

  final events = <DateTime>[
    DateTime.now(),
    DateTime(2022, 10, 10),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.green,
        title: Text(
          'Calendar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          AdvancedCalendar(
            controller: _calendarControllerToday,
            events: events,
            startWeekDay: 1,
          ),
        ],
      ),
    );
  }
}
