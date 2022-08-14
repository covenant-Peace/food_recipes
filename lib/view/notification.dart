// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipes/controller/notify_controller.dart';
import 'package:food_recipes/model/notify.dart';
import 'package:get/get.dart';

import '../constants.dart';

class Notification extends StatelessWidget {

  Notify good;
final controller = Get.put(NotifyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 29),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Color(0xfff2f2f2),
                ),
                SvgPicture.asset('images/pen.svg'),
              ],
            ),
            SizedBox(
              height: 45.97,
            ),
            Text(
              'Notification',
              style: kTextJourney10,
            ),
            SizedBox(
              height: 35,
            ),
            Obx(
              ()=> ListView.builder(itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    controller.fish = !controller.fish;
                  },
                  child: Row(children: [
                    good.leading,
                    Column(
                      children: [
                        Text(good.title, style: kTextGet4,),
                        Text(good.description, textAlign: TextAlign.center, style: kTextGet7,),
                      ],
                    ),
                    Text(good.time, style: kTextJourney3,),
                  ],
                  ),
                );
              }

              ),
            ),
        ]
        ),
      ),
    );
  }
}
