// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants.dart';

class Phone extends StatelessWidget {
  final Function onPressed;
  final TextStyle gret;
  final String labelText;

  Phone({this.onPressed, this.gret, this.labelText});
  // bool term = false;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 48.0,
        height: 21.0,
        margin: EdgeInsets.only(left: 73.0),
        child: Text(
          labelText,
          style: gret,
        ),
      ),
    );
  }
}
