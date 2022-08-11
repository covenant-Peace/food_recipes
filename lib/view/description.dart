// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';
import 'package:food_recipes/view/modal_description.dart';
import 'package:food_recipes/view/shopping_page.dart';

class Description extends StatelessWidget {
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
                    'images/flower.png',
                  ),
                ),
                Align(
                  // alignment: Alignment.bottomCenter,
                  child: DraggableScrollableSheet(
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: ModalDescription(),
                      );
                    },
                    minChildSize: 0.5,
                    initialChildSize: 0.5,
                    maxChildSize: 0.93,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(33.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.grid_view,
                        color: Color(0xFF0C0C0C),
                      ),
                      Icon(
                        Icons.search,
                        color: Color(0xFF0C0C0C),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 60.0,
          ),
        ],
      ),
    );
  }
}
