// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';
import 'package:food_recipes/paymentFile/historyCard.dart';
import 'payment_card.dart';

enum Paymentcard {
  first,
  second,
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Paymentcard selectedCard;

  // int widgetNumber = foodWidget.length;

  @override
  Widget build(BuildContext context) {
    List<Widget> foodWidget = [
      PaymentCard(
        onPressed: () {
          setState(() {
            selectedCard = Paymentcard.first;
          });
        },
        cardColor: selectedCard == Paymentcard.first
            ? Colors.white
            : Color(0xFF6A6A6A),
        fieldText: selectedCard == Paymentcard.first
            ? ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: '********',
                    hintStyle: kTextJourney9,
                    border: InputBorder.none,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.phone,
                ),
                trailing: Icon(
                  Icons.panorama_fish_eye,
                  color: selectedCard == Paymentcard.first
                      ? Colors.white
                      : Color(0xFF6A6A6A),
                ),
              )
            : ListTile(
                title: Text('******'),
                trailing: Icon(
                  Icons.panorama_fish_eye,
                  color: selectedCard == Paymentcard.first
                      ? Colors.white
                      : Color(0xFF6A6A6A),
                ),
              ),
      ),
      PaymentCard(
        onPressed: () {
          setState(() {
            selectedCard = Paymentcard.second;
          });
        },
        cardColor: selectedCard == Paymentcard.second
            ? Colors.white
            : Color(0xFF6A6A6A),
        fieldText: selectedCard == Paymentcard.second
            ? ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: '********',
                    hintStyle: kTextJourney9,
                    border: InputBorder.none,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.phone,
                ),
                trailing: Icon(
                  Icons.panorama_fish_eye,
                  color: selectedCard == Paymentcard.second
                      ? Colors.white
                      : Color(0xFF6A6A6A),
                ),
              )
            : ListTile(
                title: Text('******'),
                trailing: Icon(
                  Icons.panorama_fish_eye,
                  color: selectedCard == Paymentcard.second
                      ? Colors.white
                      : Color(0xFF6A6A6A),
                ),
              ),
      ),
    ];
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 26.0),
                  height: 20.0,
                  width: 20.0,
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.keyboard_arrow_left_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 58.0,
              ),
              Container(
                height: 24.0,
                width: 130.0,
                alignment: Alignment.topCenter,
                child: Text(
                  'Payment History',
                  style: kTextJourney11,
                ),
              )
            ],
          ),
          SizedBox(
            height: 35.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 18.0, right: 36.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 128.0,
                  height: 21.0,
                  margin: EdgeInsets.only(left: 26.0),
                  child: Text(
                    'Saved payment card',
                    style: kTextJourney9,
                  ),
                ),
                SizedBox(
                  width: 70.0,
                ),
                Container(
                  color: Colors.orange,
                  height: 28.0,
                  width: 80.0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_box_outlined,
                        color: Colors.black,
                      ),
                      Text(
                        'Add new',
                        style: kTextJourney7,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Column(
            children: <Widget>[
              foodWidget.first,
              SizedBox(
                height: 19.0,
              ),
              foodWidget.last
            ],
          ),
          SizedBox(
            height: 38.0,
          ),
          Container(
            height: 21.0,
            width: 58.0,
            margin: EdgeInsets.only(left: 26.0),
            child: Text(
              'History()',
              style: kTextJourney13,
            ),
          ),
          HistoryCard(
            food: 'Fruit Salad + Ogbono Soup + Small chop ...',
            amount: 8000,
          ),
          HistoryCard(
            food: 'Fruit Salad + Ogbono Soup + Small chop ...',
            amount: 8000,
          ),
          HistoryCard(
            food: 'Fruit Salad + Ogbono Soup + Small chop ...',
            amount: 5000,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedCard == Paymentcard.first
                    ? foodWidget.removeAt(0)
                    : foodWidget.removeAt(1);
              },
              );
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
                'Delete Card',
                style: kTextJourney4,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
