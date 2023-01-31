import 'package:calender/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Routes/RoutesName.dart';
import '../views/SignIn.dart';

final authFirebase = FirebaseAuth.instance;
Future<void> googleSignIn(context) async {
  final googleSignIn = GoogleSignIn();
  final googleAccount = await googleSignIn.signIn();
  if (googleAccount != null) {
    final googleAuth = await googleAccount.authentication;
    if (googleAuth.accessToken != null && googleAuth.idToken != null) {
      try {
        final authResult = await authFirebase.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );

        if (authResult.additionalUserInfo!.isNewUser) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const SignIn()));
        } else {
          Utils.flushBarError('Welcome Back', context);
          Navigator.pushReplacementNamed(context, RoutesName.home);
        }
      } catch (e) {
        Utils.flushBarError(e.toString(), context);
      }
    }
  }
}
