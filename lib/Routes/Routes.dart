import 'package:calender/views/AddEvent.dart';
import 'package:calender/views/HomePage.dart';
import 'package:calender/views/SignIn.dart';
import 'package:calender/views/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'RoutesName.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.signIn:
        return MaterialPageRoute(builder: (context) => const SignIn());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route defined'),
            ),
          );
        });
    }
  }
}
