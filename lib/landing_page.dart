// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:food_recipes/controller/category_controller.dart';
import 'package:get/get.dart';

import 'constants.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 39, right: 30, top: 40, bottom: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset('images/girl.png'),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Welcome Hafeez!',
                      style: kTextGet8,
                    ),
                  ],
                ),
                CircleAvatar(
                  child: Icon(Icons.notifications_outlined),
                  backgroundColor: Colors.transparent,
                  radius: 26,
                  foregroundColor: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: 42,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33.0),
                  color: Color(0xFF222222),
                  border: Border(
                    top: BorderSide(
                        color: Color(0xffe5e5e5),
                        width: 1,
                        style: BorderStyle.solid),
                    bottom: BorderSide(
                        color: Color(0xffe5e5e5),
                        width: 1,
                        style: BorderStyle.solid),
                    left: BorderSide(
                        color: Color(0xffe5e5e5),
                        width: 1,
                        style: BorderStyle.solid),
                    right: BorderSide(
                        color: Color(0xffe5e5e5),
                        width: 1,
                        style: BorderStyle.solid),
                  )),
              height: 53,
              child: ListTile(
                leading: Icon(
                  Icons.search,
                  color: Color(0xffe5e5e5),
                ),
                title: TextField(
                  decoration: InputDecoration(
                      hintText: 'Input your search here',
                      hintStyle: kTextGet9,
                      border: InputBorder.none),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            SizedBox(
              height: 39,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: kTextGet8,
                ),
                Text(
                  'See all',
                  style: kTextJourney22,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Buit(),
            SizedBox(
              height: 45,
            ),
            Text(
              'Saved',
              style: kTextGet8,
            ),

          ],
        ),
      ),
    );
  }
}

class Buit extends StatelessWidget {
  // const Buit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetX<CategoryController>(
          builder: ((controller) => ListView.builder(
                itemBuilder: (context, index) => Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(controller.cats[index].imgae),
                        Text(
                          controller.cats[index].textImage,
                          style: kTextGet10,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
                itemCount: controller.cats.length,
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                controller: ScrollController(),
                // padding: EdgeInsets.only(left: 10, right: 10),
              ))),
    );
  }
}
