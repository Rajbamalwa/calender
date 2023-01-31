import 'package:calender/Utils/Colors/Colors.dart';
import 'package:calender/Utils/theme.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Buttons({
    Key? key,
    required this.onPress,
    required this.child,
    required this.height,
    this.loading = false,
  }) : super(key: key);
  final bool loading;
  Function() onPress;
  Widget child;
  double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
        child: InkWell(
            onTap: onPress,
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                height: height,
                child: Center(
                    child: loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : child))));
  }
}
