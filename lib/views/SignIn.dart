import 'package:flutter/material.dart';

import '../Utils/Button/SignInbutton.dart';
import '../Utils/Colors/Colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass().blue100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ClipRRect(
              child: Image(image: AssetImage('assets/images/login.png')),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: SizedBox(child: googleButton()),
            ),
          ],
        ),
      ),
    );
  }
}
