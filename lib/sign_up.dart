// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_recipes/auth_service.dart';
import 'package:food_recipes/journey.dart';
import 'package:food_recipes/log_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'bottom_navigation.dart';
import 'constants.dart';

TextEditingController text = TextEditingController();
String name = ' ';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  static const String id = 'sign_up';
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String email;
  String password;
  bool showSpinner = false;
  User user;
  Timer timer;
  bool validate = false;
  String phoneNumber;

  Future<void> checkVerify() async {
    user = _auth.currentUser;
    user.sendEmailVerification();
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BottomNavigation(0)));
    }
  }

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
                'Sign up',
                style: kTextJourney6,
              ),
              SizedBox(
                height: 27.0,
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
                      labelText: 'Enter Full name',
                      labelStyle: kTextJourney3,
                      // errorText:
                      //     validate == false ? 'Please, Enter your name' : null,
                      border: InputBorder.none,
                    ),
                    obscureText: false,
                    style: kTextJourney3,
                    keyboardType: TextInputType.text,
                    controller: text,
                    onChanged: (val) {
                      name = val;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      // FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 14.0,
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
                height: 5.0,
              ),
              Container(
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
                      labelText: 'Enter your phone number',
                      labelStyle: kTextJourney3,
                      border: InputBorder.none,
                    ),
                    obscureText: false,
                    style: kTextJourney3,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              Container(
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
                      labelText: 'Enter password',
                      labelStyle: kTextJourney3,
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                    style: kTextJourney3,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(11.0),
              //       color: Color(0xFF222222),
              //       border: Border(
              //         top: BorderSide(
              //             color: Color(0xFF6A6A6A),
              //             width: 1,
              //             style: BorderStyle.solid),
              //         bottom: BorderSide(
              //             color: Color(0xFF6A6A6A),
              //             width: 1,
              //             style: BorderStyle.solid),
              //         left: BorderSide(
              //             color: Color(0xFF6A6A6A),
              //             width: 1,
              //             style: BorderStyle.solid),
              //         right: BorderSide(
              //             color: Color(0xFF6A6A6A),
              //             width: 1,
              //             style: BorderStyle.solid),
              //       )),
              //   child: ListTile(
              //     title: TextField(
              //       decoration: InputDecoration(
              //         labelText: 'Confirm password',
              //         labelStyle: kTextJourney3,
              //         border: InputBorder.none,
              //       ),
              //       obscureText: true,
              //       style: kTextJourney3,
              //       keyboardType: TextInputType.text,
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 23.0,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    showSpinner = true;
                    text.text.isEmpty ? validate = false : validate = true;
                  });
                  if (validate == true) {
                    try {

                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      FirebaseAuth.instance.currentUser
                          .updateDisplayName(name);

                      if (newUser != null) {
                        _firestore.collection('account details').add({
                          'Full name': name,
                          'email': email,
                          'password': password,
                          'phone number': phoneNumber
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyEmail()));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(e.message.toString()),
                        duration: Duration(seconds: 6),
                      ));
                    }
                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
                child: Container(
                  height: 56.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48.0),
                    color: Color(0xFFEDA92E),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Sign up',
                    style: kTextJourney4,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 21.0,
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
                    borderRadius: BorderRadius.circular(48.0),
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
                        'Sign up with Google',
                        style: kTextJourney7,
                        textAlign: TextAlign.center,
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
                  await AUthService().signInWithFacebook(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigation(0)));
                },
                child: Container(
                  height: 56.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48.0),
                    color: Color(0xFF3B5998),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/facebook.png'),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Sign up with Facebook',
                        style: kTextJourney7,
                        textAlign: TextAlign.center,
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
                    'Already have an account?',
                    style: kTextJourney3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      ' Login',
                      style: kTextJourney8,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 31.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => JourneyScreen()));
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
