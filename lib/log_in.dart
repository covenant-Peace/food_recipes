// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_recipes/passwordFile/forgot_password.dart';
import 'package:food_recipes/journey.dart';
import 'package:food_recipes/paymentFile/payment.dart';
import 'constants.dart';
import 'sign_up.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Text(
              'Log In',
              style: kTextJourney6,
            ),
            width: 122.0,
            height: 48.0,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 44.0),
          ),
          SizedBox(
            height: 47.0,
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
                  hintText: 'Email',
                  hintStyle: kTextJourney5,
                  border: InputBorder.none,
                ),
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
          SizedBox(
            height: 14.0,
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
                  hintText: 'Enter password',
                  hintStyle: kTextJourney3,
                  border: InputBorder.none,
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          SizedBox(
            height: 11.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgotPassword()));
            },
            child: Container(
              height: 21.0,
              width: 124.0,
              margin: EdgeInsets.only(right: 44.0),
              child: Text(
                'Forgot Password?',
                style: kTextJourney9,
              ),
              alignment: Alignment.bottomRight,
            ),
          ),
          SizedBox(
            height: 11.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()));
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
            children: <Widget>[
              Container(
                width: 130.0,
                margin: EdgeInsets.only(left: 44.0),
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
                margin: EdgeInsets.only(right: 44.0),
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
            onTap: () {},
            child: Container(
              width: 341.0,
              height: 56.0,
              margin: EdgeInsets.only(left: 44.0, right: 43.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: Color(0xFFF2F2F2),
              ),
              alignment: Alignment.center,
              child: Text(
                'Sign up with Google',
                style: kTextJourney7,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 341.0,
              height: 56.0,
              margin: EdgeInsets.only(left: 44.0, right: 43.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: Color(0xFF3B5998),
              ),
              alignment: Alignment.center,
              child: Text(
                'Sign up with Facebook',
                style: kTextJourney7,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Don\'t have an account?',
                  style: kTextJourney3,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Container(
                  child: Text(
                    'Signup',
                    style: kTextJourney8,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 70.0,
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
                      color: Colors.orange, width: 1, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.orange, width: 1, style: BorderStyle.solid),
                  left: BorderSide(
                      color: Colors.orange, width: 1, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.orange, width: 1, style: BorderStyle.solid),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 44.0,
                    child: Text(
                      'Skip for now',
                      style: kTextJourney5,
                      textAlign: TextAlign.center,
                    ),
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
    );
  }
}
