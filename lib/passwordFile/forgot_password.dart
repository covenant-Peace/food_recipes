// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/log_in.dart';
import '../constants.dart';
import 'phone.dart';

enum Call {
  phone,
  email,
}


class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  Call selectedCall;

  var currentFocus;

  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        unfocus;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF222222),
          body: Padding(
            padding: const EdgeInsets.only(left: 43.0, right: 43.0, top: 27.0),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Forgot Password',
                  style: kTextJourney10,
                ),
                SizedBox(
                  height: 19.0,
                ),
                Text(
                  'You can retrieve or get back your account by resetting your password with your phone number or email address',
                  style: kTextJourney9,
                ),
                SizedBox(
                  height: 42.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Phone(
                      onPressed: () {
                        setState(() {
                          selectedCall = Call.phone;
                        });
                      },
                      labelText: 'Phone',
                      gret: selectedCall == Call.phone
                          ? kTextJourney11
                          : kTextJourney12,
                    ),
                    SizedBox(
                      width: 90.0,
                    ),
                    Phone(
                      onPressed: () {
                        setState(() {
                          selectedCall = Call.email;
                        });
                      },
                      labelText: 'Email',
                      gret: selectedCall == Call.email
                          ? kTextJourney11
                          : kTextJourney12,
                    ),
                  ],
                ),
                SizedBox(
                  height: 11.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 130.0,
                      child: Divider(
                        thickness: 2.0,
                        color: selectedCall == Call.phone? Colors.orange : Color(0xFF6A6A6A),
                      ),
                    ),
                    Container(
                      width: 130.0,
                      child: Divider(
                        thickness: 2.0,
                        color: selectedCall == Call.email? Colors.orange : Color(0xFF6A6A6A),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  width: 354.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFF222222),
                      border: Border(
                        top: BorderSide(
                            color: Colors.orange, width: 1, style: BorderStyle.solid),
                        bottom: BorderSide(
                            color: Colors.orange, width: 1, style: BorderStyle.solid),
                        left: BorderSide(
                            color: Colors.orange, width: 1, style: BorderStyle.solid),
                        right: BorderSide(
                            color: Colors.orange, width: 1, style: BorderStyle.solid),
                      )),
                  child: ListTile(
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: selectedCall == Call.email ? 'Email' : 'Phone',
                        hintStyle: kTextJourney5,
                        border: InputBorder.none,
                      ),

                      obscureText: false,
                      keyboardType: selectedCall == Call.email
                          ? TextInputType.emailAddress
                          : TextInputType.phone,
                    ),
                  ),
                ),
                SizedBox(
                  height: 34.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Container(
                    height: 56.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: Color(0xFFEDA92E),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Proceed',
                      style: kTextJourney4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
