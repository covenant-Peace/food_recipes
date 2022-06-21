// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'constants.dart';

class JourneyScreen extends StatelessWidget {
  static const String id = 'journey_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              // padding: EdgeInsets.only(left: 0.0, right: 0.0),
              child: Image.asset(
                'images/child.png',
                // width: 500.0,
                //   color: Color(0xFFC4C4C4),
              ),
              height: 600.0,
              // width: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 312.5,
              width: 428.0,
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 47.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 219.0,
                    height: 36.0,
                    child: Text(
                      'Start your journey',
                      style: kTextJourney,
                    ),
                  ),
                  SizedBox(
                    height: 19.0,
                  ),
                  Container(
                    width: 208.0,
                    height: 42.0,
                    // margin: EdgeInsets.only(left: 110.0, right: 110.0),
                    child: Text(
                      'Make order or read recipe of your favourite meal at a go',
                      style: kTextJourney2,
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 34.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFEDA92E),
                      child: Text(
                        'Go',
                        style: kTextJourney,
                        textAlign: TextAlign.center,
                      ),
                      radius: 35.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
