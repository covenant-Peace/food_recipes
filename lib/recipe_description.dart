// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottom_navigation.dart';
import 'constants.dart';

class Salad extends StatefulWidget {
  // const Salad({Key? key}) : super(key: key);

  @override
  State<Salad> createState() => _SaladState();
}

class _SaladState extends State<Salad> {
  @override
  Widget build(BuildContext context) {
    double geth(double h) {
      return MediaQuery.of(context).size.height * (h / 858.16);
    }

    double getw(double w) {
      return MediaQuery.of(context).size.width * (w / 433.84);
    }

    return Scaffold(
      backgroundColor: Color(0xff222222),
      body: Padding(
        padding: EdgeInsets.only(
            top: geth(54.54), left: getw(38.46), right: getw(36)),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigation(0)));
                FocusScope.of(context).unfocus();
              },
              child: Icon(
                Icons.keyboard_arrow_left_sharp,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: geth(26.54),
            ),
            Text(
              'Salads',
              style: kTextJourney18,
            ),
            SizedBox(
              height: geth(8),
            ),
            Row(
              children: [
                Text(
                  '25 mins',
                  style: kTextJourney28,
                ),
                Text(
                  '3 Serving',
                  style: kTextJourney28,
                ),
                Text(
                  '106 Cal',
                  style: kTextJourney28,
                )
              ],
            ),
            SizedBox(
              height: geth(23.29),
            ),
            Text(
              'Ingredient',
              style: kTextJourney14,
            ),
            SizedBox(
              height: geth(6),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0xff6a6a6a),
            ),
            SizedBox(
              height: geth(9),
            ),
            Row(
              children: [
                Text('2 Eggs', style: kTextJourney28),
                Text('1/2 Cup Whole Milk', style: kTextJourney28)
              ],
            ),
            SizedBox(
              height: geth(3),
            ),
            Row(
              children: [
                Text(
                  '2 Eggs',
                  style: kTextJourney28,
                ),
                Text('1/2 Cup Whole Milk', style: kTextJourney28)
              ],
            ),
            SizedBox(
              height: geth(22),
            ),
            Text(
              'Direction',
              style: kTextJourney14,
            ),
            SizedBox(
              height: geth(3),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0xff6a6a6a),
            ),
            Row(
              children: [
                Text(
                  '•  ',
                  style: TextStyle(color: Color(0xffeda92e), fontSize: 15),
                ),
                Text(
                  'commodo et sit tortor dolor commodo sed. Felis id integer ut aenean ipsum morbi turpis',
                  style: kTextJourney28,
                )
              ],
            ),
            SizedBox(
              height: geth(11),
            ),
            Row(
              children: [
                Text(
                  '•  ',
                  style: TextStyle(color: Color(0xffeda92e), fontSize: 15),
                ),
                Text(
                  'commodo et sit tortor dolor commodo sed. Felis id integer ut aenean ipsum morbi turpis',
                  style: kTextJourney28,
                )
              ],
            ),
            SizedBox(
              height: geth(11),
            ),
            Row(
              children: [
                Text(
                  '•  ',
                  style: TextStyle(color: Color(0xffeda92e), fontSize: 15),
                ),
                Text(
                  'commodo et sit tortor dolor commodo sed. Felis id integer ut aenean ipsum morbi turpis',
                  style: kTextJourney28,
                )
              ],
            ),
            SizedBox(
              height: geth(28),
            ),
            Row(
              children: [
                Text('Share via   '),
                SvgPicture.asset('images/fb.svg'),
                SvgPicture.asset('images/whatsapp.svg'),
                SvgPicture.asset('images/twitter.svg'),
                SvgPicture.asset('images/instagram.svg')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
