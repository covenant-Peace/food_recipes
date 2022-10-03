// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipes/drawer.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'controller/salad2_controller.dart';
import 'controller/salad_controller.dart';

class Categories extends StatelessWidget {
  final controllers = Get.put(SaladController());
  final controllerss = Get.put(Salad2Controller());

  final GlobalKey<ScaffoldState> _gkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _gkey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
              onTap: () => _gkey.currentState?.openDrawer(),
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
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GetX<SaladController>(
                        builder: ((controllers) => ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, right: 10, top: 14),
                                  child: Stack(
                                    children: [
                                      Image.asset(controllers.sals[index].pict),
                                      Positioned(
                                        child: Text(
                                          controllers.sals[index].tit,
                                          style: kTextJourney11,
                                        ),
                                        bottom: 15,
                                        left: 15,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: controllers.sals.length,
                            ))),
                  ),
                  Expanded(
                    child: GetX<Salad2Controller>(
                        builder: ((controllerss) => ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                          controllerss.sals[index].pict),
                                      Positioned(
                                        child: Text(
                                          controllerss.sals[index].tit,
                                          style: kTextJourney11,
                                        ),
                                        bottom: 15,
                                        left: 15,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: controllerss.sals.length,
                            ))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
