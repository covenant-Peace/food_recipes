// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';
import 'package:food_recipes/view/shopping_page.dart';

import '../model/food.dart';

class PlaceOrder extends StatelessWidget {
  final Food example;

  const PlaceOrder(this.example);

  @override
  Widget build(BuildContext context) {
    ScrollController controller;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF222222),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipRRect(
                      child: Image.network(
                        example.image,
                        fit: BoxFit.fitWidth,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Align(
                    child: DraggableScrollableSheet(
                      builder: (context, scrollableController) {
                        return SingleChildScrollView(
                          controller: controller,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFF222222),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(62.0),
                                topRight: Radius.circular(62.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 40.0, right: 40.0),
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
                                    height: 26.0,
                                  ),
                                  Text(
                                    example.name,
                                    style: kTextJourney18,
                                  ),
                                  SizedBox(
                                    height: 11.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            example.servingTime,
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
                                            example.servingNumber.toString(),
                                            style: kTextJourney9,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons
                                                .local_fire_department_outlined,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            '${example.kcal} kcal',
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
                                  Flexible(
                                    child: ListView.builder(
                                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      //   crossAxisCount: 2,
                                      //   crossAxisSpacing: 1,
                                      //       mainAxisSpacing: 0
                                      // ),
                                      // physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: example.ingredient.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                example.ingredient[index],
                                                style: kTextJourney9,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      shrinkWrap: true,
                                    ),
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
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: example.direction.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                example.direction[index],
                                                style: kTextJourney9,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      minChildSize: 0.60,
                      initialChildSize: 0.62,
                      maxChildSize: 0.93,
                    ),
                  ),
                  Positioned(
                      top: 20,
                      left: 30,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 17,
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                  Positioned(
                      top: 30,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoppingPage()));
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
      ),
    );
  }
}
