// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipes/controller/notify_controller.dart';
import 'package:get/get.dart';

import '../constants.dart';

class Going extends StatelessWidget {
  final controller = Get.put(NotifyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 29),
        child: ListView(children: [
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
                () => ListView.builder(itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.fish.value = !controller.fish.value;
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      controller.notes[index].leading,
                      color: controller.fish.value
                          ? Color(0xffe5e5e5)
                          : Color(0xff6a6a6a),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            controller.fish.value
                                ? CircleAvatar(
                              radius: 4,
                              backgroundColor: Color(0xffeda92e),
                            )
                                : SizedBox(
                              width: 0.01,
                            ),
                            Text(
                              controller.notes[index].title,
                              style: controller.fish.value
                                  ? kTextGet4
                                  : kTextJourney21,
                            ),
                          ],
                        ),
                        Text(
                          controller.notes[index].description,
                          textAlign: TextAlign.center,
                          style:
                          controller.fish.value ? kTextGet7 : kTextJourney3,
                        ),
                      ],
                    ),
                    Text(
                      controller.notes[index].time,
                      style: kTextJourney3,
                    ),
                  ],
                ),
              );
            }),
          ),
        ]),
      ),
    );
  }
}
