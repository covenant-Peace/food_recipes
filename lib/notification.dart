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
    return GetMaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff222222),
        body: Padding(
          padding: const EdgeInsets.only(left: 35, right: 29, top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Color(0xfff2f2f2),
                    size: 15,
                  ),
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
            Expanded(
              child: GetX<NotifyController>(builder:
                    (controller) => ListView.builder(
                        itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.fish.value = !controller.fish.value;
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          controller.notes[index].leading,
                          color: controller.fish.value
                              ? Color(0xffe5e5e5)
                              : Color(0xff6a6a6a),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                SizedBox(
                                  width: 13,
                                ),
                                Text(
                                  controller.notes[index].title,
                                  style: controller.fish.value
                                      ? kTextGet4
                                      : kTextJourney21,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 252,
                              child: Text(
                                controller.notes[index].description,
                                textAlign: TextAlign.start,
                                style:
                                controller.fish.value ? kTextGet7 : kTextJourney3,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                        Text(
                          controller.notes[index].time,
                          style: kTextJourney3,
                        ),
                      ],
                    ),
                  );

                },
                      itemCount: controller.notes.length,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
