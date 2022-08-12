// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/paymentFile/payment.dart';
import 'bottom_navigation.dart';
import 'card_number.dart';
import 'constants.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  BottomNavigation just;

  List<CardNumber> peace = [
    CardNumber(),
    CardNumber(),
    CardNumber(),
    CardNumber(),
  ];

  Paymentcard selectedCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      bottomNavigationBar: just,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 36, right: 36, top: 26, bottom: 36),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_arrow_left_sharp,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Payment Method',
                  style: kTextJourney11,
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            SizedBox(
              height: 35.0,
            ),
            Text(
              'Saved payment card',
              style: kTextJourney9,
            ),
            SizedBox(
              height: 34.0,
            ),
            Container(
              width: 354.0,
              height: 56.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFF222222),
                  border: Border(
                    top: BorderSide(
                        color: Colors.orange,
                        width: 1,
                        style: BorderStyle.solid),
                    bottom: BorderSide(
                        color: Colors.orange,
                        width: 1,
                        style: BorderStyle.solid),
                    left: BorderSide(
                        color: Colors.orange,
                        width: 1,
                        style: BorderStyle.solid),
                    right: BorderSide(
                        color: Colors.orange,
                        width: 1,
                        style: BorderStyle.solid),
                  )),
              child: ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    labelText: 'Cardholder\'s name',
                    labelStyle: kTextJourney5,
                    border: InputBorder.none,
                  ),
                  obscureText: false,
                  style: kTextJourney5,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              'Card Number',
              style: kTextJourney17,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <CardNumber>[
                peace[0],
                peace[1],
                peace[2],
                peace[3],
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Expiration date',
                  style: kTextJourney17,
                ),
                Text(
                  'cvv/cvc',
                  style: kTextJourney17,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CardNumber1(),
                CardNumber1(),
                SizedBox(
                  width: 46.0,
                ),
                Container(
                  width: 100.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFF222222),
                      border: Border(
                        top: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                        bottom: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                        left: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                        right: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                      )),
                  child: ListTile(
                    title: TextField(
                      decoration: InputDecoration(
                        // hintText: '1234',
                        // hintStyle: kTextJourney16,
                        border: InputBorder.none,
                      ),
                      obscureText: false,
                      maxLength: 3,
                      style: kTextJourney17,
                      keyboardType: TextInputType.phone,
                      onChanged: (newText){
                        if(newText.length == 3){
                          FocusScope.of(context).unfocus();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 140.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()));
              },
              child: Container(
                width: 341.0,
                height: 56.0,
                margin: EdgeInsets.only(left: 44.0, right: 43.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Color(0xFFEDA92E),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Add card',
                  style: kTextJourney4,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardNumber1 extends StatelessWidget {
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
            // hintText: '1234',
            // hintStyle: kTextJourney16,
            border: InputBorder.none,
          ),
          obscureText: false,
          maxLength: 2,
          style: kTextJourney16,
          cursorColor: Colors.white,
          keyboardType: TextInputType.phone,
          onChanged: (newText) {
            cpNumber = newText;
            if(newText.length == 2){
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}

