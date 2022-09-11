// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';
import 'package:food_recipes/sign_up.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'bottom_navigation.dart';

class AUthService {
  handleAuthState() {
    return StreamBuilder(
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return BottomNavigation(0);
        } else {
          return SignUpScreen();
        }
      },
      stream: FirebaseAuth.instance.authStateChanges(),
    );
  }

  signInWithGoogle() async {
    final GoogleSignInAccount googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }
}

class VerifyEmail extends StatefulWidget {
  // const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isVerified = false;

  @override
  void initState() {
    super.initState();
    isVerified = FirebaseAuth.instance.currentUser.emailVerified;
    if (!isVerified) {
      sendVerify();
    }
  }

  Future sendVerify() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user.sendEmailVerification();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$e'),
        duration: Duration(seconds: 6),
      ));
    }
  }

  @override
  Widget build(BuildContext context) => isVerified
      ? BottomNavigation(0)
      : showDialog(
          context: context,
          builder: (context) => Dialog(
                backgroundColor: Colors.transparent,
                child: Text(
                  'An email link has been sent to your mail. Please verify!.',
                  style: kTextJourney31,
                  textAlign: TextAlign.center,
                ),
              ));
}
