import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
