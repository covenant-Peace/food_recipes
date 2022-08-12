// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';
import 'package:food_recipes/view/modal_sheet.dart';
import 'package:food_recipes/view/shopping_page.dart';

class PlaceOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              // fit: StackFit.expand,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'images/hotdog.png',
                    // width: 500.0,
                    //   color: Color(0xFFC4C4C4),
                  ),
                ),
                Align(
                  // alignment: Alignment.bottomCenter,
                  child: DraggableScrollableSheet(
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: ModalSheet(),
                      );
                    },
                    minChildSize: 0.60,
                    initialChildSize: 0.68,
                    maxChildSize: 0.93,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 56.0,
            margin: EdgeInsets.only(left: 36.0, right: 36.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48.0),
                color: Color(0xFF222222),
                border: Border(
                  top: BorderSide(
                      color: Colors.orange, width: 1, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.orange, width: 1, style: BorderStyle.solid),
                  left: BorderSide(
                      color: Colors.orange, width: 1, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.orange, width: 1, style: BorderStyle.solid),
                )),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShoppingPage()));
              },
              child: Center(
                child: Text(
                  'Place an order',
                  style: kTextJourney19,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
