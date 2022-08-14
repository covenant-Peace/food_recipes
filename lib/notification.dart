// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

class Notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Color(0xfff2f2f2),
              ),
              SvgPicture.asset('images/pen.svg'),
            ],
          ),
          SizedBox(
            height: 45.97,
          ),
          Text('Notification',
          style: kTextJourney10,
          ),
          SizedBox(
            height: 35,
          ),

        ],
      ),
    );
  }
}
