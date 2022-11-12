// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/services/auth_service.dart';
import 'package:food_recipes/bottom_navigation.dart';
import 'package:food_recipes/journey.dart';
import 'package:food_recipes/passwordFile/forgot_password.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'constants.dart';
import 'sign_up.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.only(left: 38.0, right: 36.0),
          child: ListView(
            children: <Widget>[
              Text(
                'Log In',
                style: kTextJourney6,
              ),
              SizedBox(
                height: 47.0,
              ),
              SizedBox(
                height: 56,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text(
                      " Email ",
                      style: kTextJourney5,
                    ),
                    //enabled: true,
                    fillColor: Colors.orange,
                    hoverColor: Colors.orange,
                    focusColor: Colors.orange,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(11)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(11)),
                  ),
                  obscureText: false,
                  style: kTextJourney5,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.0),
                    color: Color(0xFF222222),
                    border: Border(
                      top: BorderSide(
                          color: Color(0xFF6A6A6A),
                          width: 1,
                          style: BorderStyle.solid),
                      bottom: BorderSide(
                          color: Color(0xFF6A6A6A),
                          width: 1,
                          style: BorderStyle.solid),
                      left: BorderSide(
                          color: Color(0xFF6A6A6A),
                          width: 1,
                          style: BorderStyle.solid),
                      right: BorderSide(
                          color: Color(0xFF6A6A6A),
                          width: 1,
                          style: BorderStyle.solid),
                    )),
                child: ListTile(
                  title: TextField(
                    decoration: InputDecoration(
                      // hintText: 'Enter password',
                      labelText: 'Enter Password',
                      labelStyle: kTextJourney3,
                      // hintStyle: kTextJourney3,
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                    style: kTextJourney5,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 11.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 1.0,
                    ),
                    Text(
                      'Forgot Password?',
                      style: kTextJourney9,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 11.0,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    // if (_auth.currentUser != null) {
                    //   if (!_auth.currentUser.emailVerified) {
                    //     await _auth.currentUser.sendEmailVerification();
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       content: Text('Email Sent'),
                    //       duration: Duration(seconds: 6),
                    //     ));
                    //   } else {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AUthService().handleAuthState()));
                      //     }
                      //   }
                    }
                  } catch (e) {
                    print(e);
                    // await _auth.currentUser.sendEmailVerification();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.message.toString()),
                      duration: Duration(seconds: 6),
                    ));
                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
                child: Container(
                  height: 56.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    color: Color(0xFFEDA92E),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Log In',
                    style: kTextJourney4,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 31.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 130.0,
                    child: Divider(
                      thickness: 1.0,
                      color: Color(0xFF6A6A6A),
                    ),
                  ),
                  Text(
                    'or',
                    style: kTextJourney3,
                  ),
                  Container(
                    width: 130.0,
                    child: Divider(
                      thickness: 1.0,
                      color: Color(0xFF6A6A6A),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    await AUthService().googleSignIn(context);
                    // GoogleSignIn().signIn();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigation(0)));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.message.toString()),
                      duration: Duration(seconds: 6),
                    ));
                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
                child: Container(
                  height: 56.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    color: Color(0xFFF2F2F2),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/google.png'),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Continue with Google',
                        style: kTextJourney7,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              GestureDetector(
                onTap: () async {
                  // setState(() {
                  //   showSpinner = false;
                  // });
                  await AUthService().signInWithFacebook(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigation(0)));
                  // setState(() {
                  //   showSpinner = false;
                  // });
                },
                child: Container(
                  height: 56.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    color: Color(0xFF3B5998),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/facebook.png'),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Continue with Facebook',
                        style: kTextJourney7,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\'t have an account?',
                    style: kTextJourney3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      ' Signup',
                      style: kTextJourney8,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => JourneyScreen()));
                },
                child: Center(
                  child: Container(
                    height: 76.0,
                    width: 76.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border(
                        top: BorderSide(
                            color: Colors.orange,
                            width: 1,
                            style: BorderStyle.solid),
                        bottom: BorderSide(
                            color: Colors.orange,
                            width: 1,
                            style: BorderStyle.solid),
                        left: BorderSide(
                            color: Colors.orange,
                            width: 1,
                            style: BorderStyle.solid),
                        right: BorderSide(
                            color: Colors.orange,
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Skip \nfor now',
                          style: kTextJourney5,
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.arrow_right_alt_sharp,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
