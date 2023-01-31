import 'package:calender/Utils/Button/Button.dart';
import 'package:calender/views/AddEvent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../Provider/Calenderprovider.dart';
import '../Utils/Colors/Colors.dart';
import '../Utils/TextStyle/textStyle.dart';
import '../Utils/UserContainer/UserContainer.dart';
import '../Utils/Utils.dart';
import '../model/event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat format = CalendarFormat.month;

  Map<DateTime, List<Event>>? selectedEvents;

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child("events");
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CalendarData>(context, listen: false);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            scrolledUnderElevation: 0,
            titleSpacing: 2,
            title: Text('C a l e n d e r', style: textStyle().googleStyle)),
        drawer: const UserContainer(),
        body: Column(
          children: [
            TabBar(
                indicatorWeight: 0.1,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  tabBarWidget('Text 1', () {}),
                  tabBarWidget('Text 2', () {}),
                  tabBarWidget('Text 3', () {}),
                ]),
            Consumer<CalendarData>(builder: (context, value, child) {
              List<String> events = value.events;
              return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TableCalendar(
                        availableGestures: AvailableGestures.all,
                        calendarFormat: format,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        daysOfWeekVisible: true,
                        eventLoader: (DateTime date) {
                          return selectedEvents![value.selectedDate] ?? [];
                        },
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2050, 3, 14),
                        focusedDay: value.selectedDate,
                        formatAnimationCurve: Curves.ease,
                        onDaySelected: (date, events) {
                          value.setSelectedDay(date);
                        },
                        selectedDayPredicate: (day) =>
                            isSameDay(day, value.selectedDate),
                        onDayLongPressed: (date, time) {},
                        onHeaderTapped: (DateTime datetime) {
                          value.headerTapped(datetime);
                        },
                        holidayPredicate: (d) {
                          return false;
                        },
                        calendarStyle: CalendarStyle(
                          isTodayHighlighted: true,
                          outsideDaysVisible: false,
                          holidayTextStyle:
                              TextStyle(color: ColorClass().white),
                          holidayDecoration: BoxDecoration(
                              color: ColorClass().blue200,
                              shape: BoxShape.circle),
                          selectedDecoration: BoxDecoration(
                              color: ColorClass().dark, shape: BoxShape.circle),
                          selectedTextStyle:
                              const TextStyle(color: Colors.white),
                          todayDecoration: BoxDecoration(
                              color: ColorClass().white,
                              shape: BoxShape.circle),
                          defaultDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorClass().blue400),
                          weekendDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorClass().blue200),
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          formatButtonShowsNext: false,
                          formatButtonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          titleTextStyle: textStyle().googleStyle,
                          formatButtonTextStyle: TextStyle(),
                        ),
                        calendarBuilders: CalendarBuilders(
                          selectedBuilder: (context, date, events) => Container(
                              margin: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                date.day.toString(),
                                style: const TextStyle(color: Colors.white),
                              )),
                          todayBuilder: (context, date, events) => Container(
                              margin: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(color: ColorClass().black),
                              )),
                        ),
                      )));
            }),
            Text('Selected Day ${data.selectedDate.toString().split(' ')[0]}'),
            Consumer<CalendarData>(builder: (context, value, child) {
              List<String> events = value.events;
              return Expanded(
                child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(events[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            value.removeEvent(events[index]);
                          },
                        ),
                      );
                    }),
              );
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  child: SizedBox(
                      height: 50,
                      child: Center(
                          child: Text(
                              'Add Event on ${data.selectedDate.day.toString().split(' ')[0]}',
                              style: textStyle().googleStyle))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AddEvent(
                                selectedDay: data.selectedDate,
                                selectedEvents: selectedEvents)));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

/*
=> showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      'Add Events',
                      style: GoogleFonts.acme(),
                    ),
                    content: SizedBox(
                      height: 140,
                      child: Column(
                        children: [
                          Form(
                            key: titleKey,
                            child: TextFormField(
                              controller: _eventTitleController,
                              decoration: InputDecoration(
                                  labelStyle: GoogleFonts.acme(),
                                  label: Text('Add Event Title')),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Type Title';
                                }
                                return null;
                              },
                            ),
                          ),
                          Form(
                            key: detailKey,
                            child: TextFormField(
                              controller: _eventDetailController,
                              decoration: InputDecoration(
                                  labelStyle: GoogleFonts.acme(),
                                  label: Text('Add Event Detail')),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Type Title';
                                }
                                return null;
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '${selectedDay.year}/${selectedDay.month}/${selectedDay.day}',
                              style: GoogleFonts.acme(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel')),
                      TextButton(
                          onPressed: () async {
                            AddEventToDatabase().addEventOnDatabase(
                                _eventDetailController.text,
                                _eventDetailController.text,
                                selectedEvents,
                                selectedDay);
                            AddEventToDatabase().addEventOnFirestore(
                                _eventDetailController.text,
                                _eventDetailController.text,
                                selectedEvents,
                                selectedDay);
                            _eventTitleController.clear();
                            _eventDetailController.clear();
                            Navigator.pop(context);
                            setState(() {});
                            return;
                          },
                          child: const Text('Set Event'))
                    ],
                  )),
          label: const Text('Add Event')*/
