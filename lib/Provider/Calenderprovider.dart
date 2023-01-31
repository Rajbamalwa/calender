import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../model/event.dart';

class CalendarData extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  setSelectedDay(DateTime date) {
    _selectedDate = date;
    getEvent();
    notifyListeners();
  }

  headerTapped(DateTime dateTime) {
    _selectedDate = dateTime;

    notifyListeners();
  }

  Map<DateTime, List<Event>>? _selectedEvents;
  Map<DateTime, List<Event>>? get selectedEvents => _selectedEvents;
  List getEvents(DateTime dateTime) {
    return _selectedEvents![_selectedDate] ?? [];
  }

  List<String> _events = [];
  List<String> get events => _events;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    getEvent();
  }

  void getEvent() async {
    List<String> temp = [];
    await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid.toString())
        .doc(_selectedDate.toString().split(' ')[0])
        .get()
        .then((doc) {
      temp = List.from(doc['events']);
    });
    _events = temp;
    notifyListeners();
  }

  void addEvent(String event, String dateTime) async {
    _events.add(event);
    await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid.toString())
        .doc(dateTime.toString())
        .set({'events': _events});
    getEvent();
  }

  void removeEvent(String event) async {
    _events.remove(event);
    await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid.toString())
        .doc(_selectedDate.toString())
        .set({'events': _events});
    getEvent();
  }
}
