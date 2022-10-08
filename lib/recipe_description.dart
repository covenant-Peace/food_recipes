// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

class Salad extends StatefulWidget {
  // const Salad({Key? key}) : super(key: key);

  @override
  State<Salad> createState() => _SaladState();
}

class _SaladState extends State<Salad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigation(0)));
                FocusScope.of(context).unfocus();
              },
              child: Icon(
                Icons.keyboard_arrow_left_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
