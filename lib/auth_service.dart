// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food_recipes/constants.dart';
import 'package:food_recipes/sign_up.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'bottom_navigation.dart';

class AUthService {
  handleAuthState() {
    return StreamBuilder(
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return VerifyEmail();
        } else {
          return SignUpScreen();
        }
      },
      stream: FirebaseAuth.instance.authStateChanges(),
    );
  }

  Future<void> googleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount googleuser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleuser.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        //   if(userCredential.additionalUserInfo.isNewUser){
        //
        //   }
        // }
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$e'),
        duration: Duration(seconds: 6),
      ));
    }
  }

  Future<void> signInWithFacebook(BuildContext context) async {

    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$e'),
        duration: Duration(seconds: 6),
      ));
    }
  }
}

class VerifyEmail extends StatefulWidget {

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
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BottomNavigation(0)));
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
      : Scaffold(
          backgroundColor: Color(0xff222222),
          body: Center(
            child: Text(
              'An email link has been sent to your mail. Please verify!.',
              style: kTextJourney31,
              textAlign: TextAlign.center,
            ),
          ),
        );
}
