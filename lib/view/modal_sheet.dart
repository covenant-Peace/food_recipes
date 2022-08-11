// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';

class ModalSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520.5,
      decoration: BoxDecoration(
        color: Color(0xFF222222),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(62.0),
          topRight: Radius.circular(62.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 18.0,
            ),
            Center(
              child: SizedBox(
                width: 40.0,
                child: Divider(
                  color: Color(0xFFE5E5E5),
                  thickness: 2.0,
                ),
              ),
            ),
            SizedBox(
              height: 46.0,
            ),
            Text(
              'Crepes with Honey',
              style: kTextJourney18,
            ),
            SizedBox(
              height: 11.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '25 Mins',
                      style: kTextJourney9,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people_outline,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '3 Serving',
                      style: kTextJourney9,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '106 Cal',
                      style: kTextJourney9,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 27.0,
            ),
            Text(
              'Ingredient',
              style: kTextJourney14,
            ),
            SizedBox(
              height: 6.0,
            ),
            Divider(
              thickness: 1.0,
              color: Color(0xFF6A6A6A),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.fiber_manual_record,
                          size: 5.0,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '2 Eggs',
                          style: kTextJourney9,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.fiber_manual_record,
                          size: 5.0,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '1/2 Cup Whole milk',
                          style: kTextJourney9,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.fiber_manual_record,
                          size: 5.0,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '2 Table spoon Butter',
                          style: kTextJourney9,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.fiber_manual_record,
                          size: 5.0,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '1 Cup of Flour',
                          style: kTextJourney9,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Direction',
              style: kTextJourney14,
            ),
            SizedBox(
              height: 3.0,
            ),
            Divider(
              thickness: 1.0,
              color: Color(0xFF6A6A6A),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.fiber_manual_record,
                      size: 5.0,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Text(
                        'commodo et sit tortor dolor commodo sed. Felis id integer ut aenean ipsum morbi turpis',
                        style: kTextJourney9,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 11.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.fiber_manual_record,
                      size: 5.0,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Text(
                        'commodo et sit tortor dolor commodo sed. Felis id integer ut aenean ipsum morbi turpis',
                        style: kTextJourney9,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
