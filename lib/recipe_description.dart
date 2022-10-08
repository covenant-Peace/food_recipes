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
    double geth(double h) {
      return MediaQuery.of(context).size.height * (h / 858.16);
    }

    double getw(double w) {
      return MediaQuery.of(context).size.width * (w / 433.84);
    }

    return Scaffold(
      backgroundColor: Color(0xff222222),
      body: Padding(
        padding: EdgeInsets.only(
            top: geth(54.54), left: getw(38.46), right: getw(36)),
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
            SizedBox(
              height: geth(26.54),
            ),
            Text('Salads')
          ],
        ),
      ),
    );
  }
}
