// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

enum Food {
  salad,
  vegetables,
  soup,
}

class Delicious extends StatelessWidget {
  // const Delicious({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _gkey = GlobalKey<ScaffoldState>();

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
      body: Padding(
        padding: EdgeInsets.only(left: getW(37)),
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
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => BottomNavigation(0)));
                  },
                  child: Container(
                    height: getH(35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFEDA92E),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Salads',
                      style: kTextJourney4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => BottomNavigation(0)));
                  },
                  child: Container(
                    height: getH(35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFEDA92E),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Vegetables',
                      style: kTextJourney4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => BottomNavigation(0)));
                  },
                  child: Container(
                    height: getH(35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFEDA92E),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Soup',
                      style: kTextJourney4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
