// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';

class HistoryCard extends StatelessWidget {
  final String food;
  final int amount;

  HistoryCard({this.amount, this.food});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: 336.0,
          height: 1.0,
          child: Divider(
            color: Color(0xFFE5E5E5),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          // margin: EdgeInsets.only(left: 18.0, right: 30.0),
          width: 340,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 155.0,
                    height: 42.0,
                    child: Text(
                      food,
                      style: kTextJourney14,
                    ),
                  ),
                  Container(
                    width: 60.0,
                    height: 18.0,
                    child: Text(
                      '23.03.2021',
                      style: kTextJourney3,
                    ),
                  ),
                ],
              ),
              Container(
                width: 40.0,
                height: 40.0,
                child: Text(
                  'NGN $amount',
                  style: kTextJourney15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
