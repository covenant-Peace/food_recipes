// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants.dart';

class Phone extends StatelessWidget {
  final VoidCallback onPressed;
  final TextStyle gret;
  final String labelText;

  Phone({required this.onPressed, required this.gret, required this.labelText});
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
