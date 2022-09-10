// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipes/controller/shopping_controller.dart';
import 'package:get/get.dart';

import 'constants.dart';

enum Food {
  salad,
  vegetables,
  soup,
}

class Delicious extends StatelessWidget {
  // const Delicious({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _gkey = GlobalKey<ScaffoldState>();
  final controller = Get.put(ShoppingController());

  Food chosen = Food.salad;

  @override
  Widget build(BuildContext context) {
    double getH(double i) {
      return (i / 926) * MediaQuery.of(context).size.height;
    }

    double getW(double j) {
      return (j / 428) * MediaQuery.of(context).size.width;
    }
    return Scaffold(
      key: _gkey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 35),
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
      body: Padding(
        padding: EdgeInsets.only(left: getW(37), right: getW(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delicious meal at fingertip',
              style: kTextJourney10,
            ),
            SizedBox(
              height: getH(6),
            ),
            Text(
              'Make order & learn to prepare\ndelicious meal',
              style: kTextJourney28,
            ),
            SizedBox(
              height: getH(18),
            ),
            Row(
              children: [
                Obx(()=> GestureDetector(
                    onTap: () {
                      // setState(() {
                        chosen = Food.salad;
                      // });
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => BottomNavigation(0)));
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: getW(18),
                          right: getW(21),
                          top: getH(4),
                          bottom: getH(7)),
                      height: getH(35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: chosen == Food.salad ? Color(0xFFEDA92E): Color(0xfff2f2f2),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Salads',
                        style: kTextJourney29,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: getW(5),
                ),
                Obx(()=> GestureDetector(
                    onTap: () {
                      // setState(() {
                        chosen = Food.vegetables;
                      // });
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => BottomNavigation(0)));
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: getW(18),
                          right: getW(21),
                          top: getH(4),
                          bottom: getH(7)),
                      height: getH(35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: chosen == Food.vegetables ? Color(0xFFEDA92E): Color(0xfff2f2f2),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Vegetables',
                        style: kTextJourney29,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: getW(5),
                ),
                Obx(()=> GestureDetector(
                    onTap: () {
                      // setState(() {
                        chosen = Food.soup;
                      // });
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => BottomNavigation(0)));
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: getW(18),
                          right: getW(21),
                          top: getH(4),
                          bottom: getH(7)),
                      height: getH(35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: chosen == Food.soup ? Color(0xFFEDA92E): Color(0xfff2f2f2),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Soup',
                        style: kTextJourney29,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: getW(20),
                ),
                SvgPicture.asset('images/filt.svg')
              ],
            ),
            SizedBox(
              height: getH(25),
            ),
            Divider(
              height: getH(0.2),
              thickness: getW(0.5),
              color: Color(0xffe5e5e5),
            ),
            SizedBox(
              height: getH(16),
            )
          ],
        ),
      ),
    );
  }
}


