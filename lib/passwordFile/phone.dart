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
      child: Text(
        labelText,
        style: gret,
      ),
    );
  }
}
