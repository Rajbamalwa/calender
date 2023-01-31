import 'dart:async';
import 'package:calender/views/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Routes/RoutesName.dart';

import '../Utils/Colors/Colors.dart';
import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  User? auth = FirebaseAuth.instance.currentUser;
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      if (auth == null) {
        Navigator.pushReplacementNamed(context, RoutesName.signIn);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass().blue100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
          child: Container(
            height: 450,
            width: 450,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash.png'),
                    fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }
}
