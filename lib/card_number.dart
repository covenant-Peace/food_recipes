// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

class CardNumber extends StatelessWidget {
  String cpNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 56.0,
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
        title: TextFormField(
          decoration: InputDecoration(
            hintText: '1234',
            hintStyle: kTextJourney16,
            border: InputBorder.none,
          ),
          obscureText: false,
          // maxLength: 4,
          inputFormatters: [
            // LengthLimitingTextInputFormatter(4),
            FilteringTextInputFormatter.digitsOnly
          ],
          style: kTextJourney17,
          cursorColor: Colors.white,
          focusNode: FocusNode(),
          keyboardType: TextInputType.phone,
          // onSaved: (String value) => _cardNumber = value,
          onChanged: (newText) {
            cpNumber = newText;
            if(newText.length == 16){
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
