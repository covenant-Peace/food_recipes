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
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'images/hotdog.png',
                  ),
                ),
                Align(
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
                Positioned(
                    top: 50,
                    left: 30,
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                      size: 17,
                    )),
                Positioned(
                    top: 50,
                    right: 30,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(11)),
                      padding: EdgeInsets.all(11),
                      child: Column(
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.black,
                            size: 17,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '182',
                            style: kTextJourney29,
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 56.0,
              margin: EdgeInsets.only(left: 36.0, right: 36.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48.0),
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
          ),
        ],
      ),
    );
  }
}
