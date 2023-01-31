import 'dart:core';
import 'package:calender/Utils/Button/Button.dart';
import 'package:calender/Utils/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Provider/Calenderprovider.dart';
import '../Provider/DatabaseProvider.dart';
import '../model/event.dart';

class AddEvent extends StatefulWidget {
  AddEvent(
      {super.key, required this.selectedDay, required this.selectedEvents});

  Map<DateTime, List<Event>>? selectedEvents;
  DateTime selectedDay;
  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _eventDetailController = TextEditingController();
  @override
  void dispose() {
    _eventTitleController.dispose();
    _eventDetailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  final titleKey = GlobalKey<FormState>();
  final detailKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass().blue100,
      appBar: AppBar(
        backgroundColor: ColorClass().blue100,
        elevation: 0,
        centerTitle: true,
        title: Text(
            '${widget.selectedDay.year}/${widget.selectedDay.month}/${widget.selectedDay.day}',
            style: GoogleFonts.acme(fontSize: 30, color: ColorClass().black)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
              child: Form(
                key: titleKey,
                child: TextFormField(
                  controller: _eventTitleController,
                  decoration: InputDecoration(
                      labelStyle: GoogleFonts.acme(),
                      label: const Text('Add Event Title'),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorClass().dark))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Type Title';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
              child: Form(
                key: detailKey,
                child: TextFormField(
                  controller: _eventDetailController,
                  decoration: InputDecoration(
                      labelStyle: GoogleFonts.acme(),
                      label: const Text('Add Event Detail'),
                      border: const OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Type Title';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Buttons(
                onPress: () {
                  Navigator.pop(context);
                },
                height: 40,
                child: const Text('Cancel')),
            Buttons(
                onPress: () async {
                  CalendarData().addEvent(_eventTitleController.text.toString(),
                      widget.selectedDay.toString().split(' ')[0]);
                  /*      AddEventToDatabase().addEventOnDatabase(
                      _eventDetailController.text,
                      _eventDetailController.text,
                      widget.selectedEvents,
                      widget.selectedDay,
                      widget.selectedDay);
                  AddEventToDatabase().addEventOnFirestore(
                      _eventDetailController.text,
                      _eventDetailController.text,
                      widget.selectedEvents,
                      widget.selectedDay,
                      widget.selectedDay);
                  _eventTitleController.clear();
                  _eventDetailController.clear();
                  Navigator.pop(context);
                  setState(() {});
                  return;*/
                },
                height: 40,
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
