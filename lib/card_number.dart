// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

class CardNumber extends StatelessWidget {
  String cpNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.0,
      height: 56.0,
      // margin: EdgeInsets.only(left: 36.0, right: 38.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xFF222222),
          border: Border(
            top: BorderSide(
                color: Color(0xFFBDBDBD), width: 1, style: BorderStyle.solid),
            bottom: BorderSide(
                color: Color(0xFFBDBDBD), width: 1, style: BorderStyle.solid),
            left: BorderSide(
                color: Color(0xFFBDBDBD), width: 1, style: BorderStyle.solid),
            right: BorderSide(
                color: Color(0xFFBDBDBD), width: 1, style: BorderStyle.solid),
          )),
      child: ListTile(
        title: TextField(
          decoration: InputDecoration(
            hintText: '1234',
            hintStyle: kTextJourney16,
            border: InputBorder.none,
          ),
          obscureText: false,
          maxLength: 4,
          style: kTextJourney17,
          cursorColor: Colors.white,
          focusNode: FocusNode(),
          keyboardType: TextInputType.phone,
          onChanged: (newText) {
            cpNumber = newText;
            if(newText.length == 4){
              FocusScope.of(context).nextFocus();
            }
          },
          onEditingComplete: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
    );
  }
}
