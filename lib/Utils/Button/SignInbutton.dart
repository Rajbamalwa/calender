import 'package:flutter/material.dart';

import '../../Provider/signInProvider.dart';
import '../TextStyle/textStyle.dart';
import 'Button.dart';

class googleButton extends StatelessWidget {
  googleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Buttons(
      height: 63,
      onPress: () {
        googleSignIn(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
            child: Image.asset('assets/images/google.png'),
          ),
          Text(
            'Continue With Google',
            style: textStyle().googleStyle,
          )
        ],
      ),
    );
  }
}
