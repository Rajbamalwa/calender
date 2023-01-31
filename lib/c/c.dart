import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../Provider/Calenderprovider.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Calendar App'),
      ),
      body: Consumer<CalendarData>(builder: (context, value, child) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TableCalendar(
                onDaySelected: (date, events) {
                  value.setSelectedDay(date);
                  //Provider.of<CalendarData>(context, listen: false)
                  // .setSelectedDay(date);
                },
                focusedDay: selectedDay,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2050, 3, 14),
              ),
              // Displays events on the selected day
              Text(selectedDay.day.toString()),
              const SizedBox(height: 20.0),
              Text(value.selectedDate.toString()),
            ],
          ),
        );
      }),
    );
  }
}
