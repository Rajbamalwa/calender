import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

import 'Colors/Colors.dart';

class Utils {
  static void flushBarError(String msg, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: msg,
          duration: const Duration(seconds: 3),
        )..show(context));
  }
}

Widget tabBarWidget(String text, Function() onPress) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      child: Text(text),
      onPressed: onPress,
    ),
  );
}
