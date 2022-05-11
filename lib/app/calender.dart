// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print, unnecessary_import, prefer_final_fields, avoid_unnecessary_containers, unnecessary_this, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:table_calendar/table_calendar.dart';

class calender extends StatefulWidget {
  const calender({Key? key}) : super(key: key);

  @override
  State<calender> createState() => _calenderState();
}

class _calenderState extends State<calender> {
  late Map<DateTime, List<Event>> slectedEvent;
  CalendarFormat format = CalendarFormat.month;
  DateTime slectedDay = DateTime.now();
  DateTime foucsedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();
  @override
  void initState() {
    slectedEvent = {};
    super.initState();
  }

  List<Event> _getEvent(DateTime date) {
    return slectedEvent[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset("imag/logo1.png")],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Calender",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: TableCalendar(
                focusedDay: foucsedDay,
                firstDay: DateTime(1999),
                lastDay: DateTime(2050),
                calendarFormat: format,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.saturday,
                daysOfWeekVisible: true,
                //chang day
                onDaySelected: (DateTime slectDay, DateTime foucsDay) {
                  setState(() {
                    slectedDay = slectDay;
                    foucsedDay = foucsDay;
                  });
                  print(foucsedDay);
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(slectedDay, date);
                },
                eventLoader: _getEvent,
                //style calender
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 84, 201, 84),
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Color.fromARGB(137, 33, 194, 39),
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: HeaderStyle(
                    formatButtonVisible: true,
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                        color: Color.fromARGB(255, 84, 201, 84),
                        borderRadius: BorderRadius.circular(15)),
                    formatButtonTextStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            ..._getEvent(slectedDay).map((Event event) => ListTile(
                  title: Text(event.title),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Add Appointment"),
                    content: TextFormField(
                      controller: _eventController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel")),
                      TextButton(
                        onPressed: () {
                          if (_eventController.text.isEmpty) {
                            
                          } else {
                            if (slectedEvent[slectedDay] != null) {
                              Event(title: _eventController.text);
                            } else {
                              slectedEvent[slectedDay] = [
                                Event(title: _eventController.text)
                              ];
                            }
                          }
                          Navigator.pop(context);
                          _eventController.clear();
                          setState(() {});
                          return;
                        },
                        child: Text("ok"),
                      )
                    ],
                  ));
        },
        label: Text("New Appointment"),
        icon: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 84, 201, 84),
        elevation: 0,
      ),
    );
  }
}

class Event {
  final String title;
  Event({required this.title});
  String toString() => this.title;
}
