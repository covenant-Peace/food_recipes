// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipes/paymentFile/payment.dart';

import 'package:food_recipes/payment_method.dart';
import 'package:image_picker/image_picker.dart';

import 'bottom_navigation.dart';
import 'constants.dart';
import 'log_in.dart';

String imageUrl = ' ';
Reference ref = FirebaseStorage.instance.ref().child('profilepic.jpg');

class App extends StatefulWidget {

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _auth = FirebaseAuth.instance;

  void pickUploadImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 75);
    ref = FirebaseStorage.instance.ref().child(image.path);
    await ref.putFile(File(image.path));
    ref.getDownloadURL().then((value) {
      print(value);
      setState(() {
        imageUrl = value;
      });
    });
  }

  Widget pic() {
    try {
      // if (_auth.currentUser.photoURL != null) {
      //   return Image.network(_auth.currentUser.photoURL);
      // }
      imageUrl == ' '
          ? Icon(
              Icons.person,
              color: Colors.white,
              size: 20,
            )
          : Image.network(imageUrl);
    } catch (e) {
      print(e);
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
            GestureDetector(
              onTap: () {
                pickUploadImage();
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(imageUrl),
                child: imageUrl == ' '
                    ? Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 20,
                      )
                    : Text(' '),
              ),
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
              title: Text('History', style: kTextJourney27),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()));
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
