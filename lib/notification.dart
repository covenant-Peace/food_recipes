// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Notification extends StatelessWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      body: ListView(
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back_ios_new_outlined, color: Color(0xfff2f2f2),),

            ],
          )
        ],
      ),
    );
  }
}
