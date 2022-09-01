// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipes/drawer.dart';

import 'constants.dart';

class Categories extends StatelessWidget {
  // const Categories({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _gkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _gkey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
              onTap: () => _gkey.currentState.openDrawer(),
              child: SvgPicture.asset(
                'images/look.svg',
                height: 4,
                width: 4,
              )),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 1,
            ),
            Icon(
              Icons.search,
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xff222222),
      drawer: App(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, top: 34.5, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: kTextJourney18,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.00216,
            ),
            Text(
              'Choose from the category to select a desired meal',
              style: kTextJourney9,
            ),

          ],
        ),
      ),
    );
  }
}
