// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants.dart';

class PaymentCard extends StatelessWidget {

  final Function onPressed;
  final Color cardColor;
  final Widget fieldText;

  PaymentCard({this.onPressed, this.cardColor, this.fieldText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 354.0,
        height: 56.0,
        margin: EdgeInsets.only(left: 36.0, right: 36.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFF222222),
            border: Border(
              top: BorderSide(
                  color: cardColor,
                  width: 1,
                  style: BorderStyle.solid),
              bottom: BorderSide(
                  color: cardColor,
                  width: 1,
                  style: BorderStyle.solid),
              left: BorderSide(
                  color: cardColor,
                  width: 1,
                  style: BorderStyle.solid),
              right: BorderSide(
                  color: cardColor,
                  width: 1,
                  style: BorderStyle.solid),
            )),
        child: GestureDetector(
          onTap: onPressed,
          child: fieldText,
        ),
      ),
    );
  }
}
