// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:food_recipes/map.dart';

import 'package:food_recipes/payment_method.dart';

import 'bottom_navigation.dart';
import 'constants.dart';
import 'log_in.dart';

class App extends StatelessWidget {
  // const App({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;
  Widget pic() {
    if (_auth.currentUser.photoURL != null) {
      return Image.network(_auth.currentUser.photoURL);
    } else {
      return Image.asset('images/girl.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent.withOpacity(0.5),
      width: MediaQuery.of(context).size.width * 0.64,
      child: Padding(
        padding: const EdgeInsets.only(top: 41, left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: pic(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.066,
            ),
            ListTile(
              leading: SvgPicture.asset('images/profile.svg'),
              title: Text(
                'Edit Profile',
                style: kTextJourney27,
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder:(context)=>Maps()));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            ListTile(
              leading: SvgPicture.asset('images/myorder.svg'),
              title: Text('My Order', style: kTextJourney27),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigation(2)));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            ListTile(
              leading: SvgPicture.asset('images/bookmark.svg'),
              title: Text('Bookmark', style: kTextJourney27),
              onTap: () {
                Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            ListTile(
              leading: SvgPicture.asset('images/paymentmethod.svg'),
              title: Text('Payment Method', style: kTextJourney27),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentMethod()));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            ListTile(
              leading: SvgPicture.asset('images/notificate.svg'),
              title: Text('Notification', style: kTextJourney27),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigation(3)));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.234,
            ),
            ListTile(
              leading: SvgPicture.asset('images/logout.svg'),
              title: Text('Log out', style: kTextJourney27),
              onTap: () async {
                await _auth.signOut();
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
          ],
        ),
      ),
    );
  }
}
