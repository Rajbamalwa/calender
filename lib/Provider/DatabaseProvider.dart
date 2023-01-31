/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../model/event.dart';

class AddEventToDatabase with ChangeNotifier {
  Event? _event;
  Event? get event => _event;
  final userEvent =
      FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser!.uid);

  final users = FirebaseFirestore.instance
      .collection(FirebaseAuth.instance.currentUser!.email.toString());
  void addEventOnDatabase(
      String eventTitle,
      String eventDetail,
      Map<DateTime, List<Event>>? selectedEvents,
      DateTime selectedDay,
      DateTime dateTime) {
    String id = selectedDay.toString().split(' ')[0];
    if (eventTitle.isEmpty) {
    } else {
      if (selectedEvents![selectedDay] != null) {
        selectedEvents[selectedDay]!.add(
            Event(title: eventTitle, detail: eventDetail, dateTime: dateTime));
      } else {
        selectedEvents[selectedDay] = [
          Event(title: eventTitle, detail: eventDetail, dateTime: dateTime)
        ];
        userEvent.child('events').set(
            Event(title: eventTitle, detail: eventDetail, dateTime: dateTime));
        userEvent
            .child('events')
            .update({
              id: {
                'title': eventTitle,
                'id': id,
                'detail': eventDetail,
              }
            })
            .then((value) {})
            .onError((error, stackTrace) {});
      }
    }
    notifyListeners();
  }

/*
  void set(
    DateTime selectedDay,
    String eventTitle,
    String eventDetail,
  ) {

    String id = selectedDay.toString().split(' ')[0];
    users.doc(id).set({
      'title': eventTitle, // John Doe
      'detail': eventDetail, // Stokes and Sons
      'id': id
    });
  }*/
  void addEventOnFirestore(
      String eventTitle,
      String eventDetail,
      Map<DateTime, List<Event>>? selectedEvents,
      DateTime selectedDay,
      DateTime dateTime) {
    String id = selectedDay.toString().split(' ')[0];
    if (eventTitle.isEmpty) {
    } else {
      if (selectedEvents![selectedDay] != null) {
        selectedEvents[selectedDay]!.add(
            Event(title: eventTitle, detail: eventDetail, dateTime: dateTime));
      } else {
        selectedEvents[selectedDay] = [
          Event(title: eventTitle, detail: eventDetail, dateTime: dateTime)
        ];
        users
            .doc(id)
            .set({
              'title': eventTitle, // John Doe
              'detail': eventDetail, // Stokes and Sons
              'id': id
            })
            .then((value) {})
            .onError((error, stackTrace) {});
      }
    }
    notifyListeners();
  }
}
*/
