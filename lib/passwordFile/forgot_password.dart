// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.keyboard_arrow_left_sharp,
                color: Colors.white,
              ),
              margin: EdgeInsets.only(left: 20.0, top: 30.0),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            child: Text(
              'Forgot Password',
              style: kTextJourney10,
            ),
            width: 122.0,
            height: 48.0,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 44.0),
          ),
          SizedBox(
            height: 19.0,
          ),
          Container(
            child: Text(
              'You can retrieve or get back your account by resetting your password with your phone number or email address',
              style: kTextJourney9,
            ),
            width: 315.0,
            height: 63.0,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 44.0, right: 60.0),
          ),
          SizedBox(
            height: 42.0,
          ),
          Row(
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
                width: 60.0,
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
            children: <Widget>[
              Container(
                height: 2.0,
                width: 130.0,
                margin: EdgeInsets.only(left: 43.0),
                child: Divider(
                  color: selectedCall == Call.phone? Colors.orange : Color(0xFF6A6A6A),
                ),
              ),
              Container(
                height: 2.0,
                width: 130.0,
                margin: EdgeInsets.only(right: 43.0),
                child: Divider(
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
            height: 56.0,
            margin: EdgeInsets.only(left: 36.0, right: 38.0),
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
              width: 341.0,
              height: 56.0,
              margin: EdgeInsets.only(left: 44.0, right: 43.0),
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
    );
  }
}
