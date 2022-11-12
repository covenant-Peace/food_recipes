// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print, missing_return

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_recipes/bottom_navigation.dart';
import 'package:food_recipes/controller/category_controller.dart';
import 'package:food_recipes/controller/rating_controller.dart';
import 'package:food_recipes/view/place_order.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'constants.dart';
import 'delicious.dart';
import 'drawer.dart';
import 'notification.dart';

final uid = FirebaseAuth.instance.currentUser.uid;

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final controller = Get.put(CategoryController());
  final controllers = Get.put(RatingController());
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    dataInfo();
    changeProfile();
    pic();
    // _auth.currentUser.updatePhotoURL(imageUrl);
  }

  @override
  void dispose() {
    super.dispose();
    App();
  }

  String name = ' ';

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  DocumentSnapshot snapshot;

  void getData() async {
    DocumentReference docref = await FirebaseFirestore.instance
        .collection('account details')
        .doc(_auth.currentUser.uid);
    var him = docref.id;
    // snapshot = data as DocumentSnapshot<Object>;
  }

  void dataInfo() async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection('account details')
        .doc(uid)
        .get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data();
      setState(() {
        name = data['Full name'];
      });
    }
    print(uid);
  }

  // String imageUrl = ' ';
  void changeProfile() async {
    await ref.getDownloadURL().then((value) {
      print(value);
      setState(() {
        imageUrl = value;
      });
    });
  }

  Widget pic() {
    try {
      setState(() {});
      // if (_auth.currentUser.photoURL != null) {
      //   return Image.network(_auth.currentUser.photoURL);
      // }
      if (imageUrl == ' ') {
        return Icon(
          Icons.person,
          color: Colors.white,
          size: 20,
        );
      } else {
        return Image.network(imageUrl);
      }
    } catch (e) {
      print(e);
    }
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double geth(double h) {
      return MediaQuery.of(context).size.height * (h / 858.16);
    }

    double getw(double w) {
      return MediaQuery.of(context).size.width * (w / 433.84);
    }

    // name = _auth.currentUser.displayName;
    return Scaffold(
      backgroundColor: Color(0xff222222),
      key: _key,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              _key.currentState.openDrawer();
              changeProfile();
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
              // Image.network(_auth.currentUser.photoURL),
              // Image.asset('images/girl.png'),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome ${_auth.currentUser.displayName}!',
              style: kTextGet8,
            ),
            GestureDetector(
              onTap: () =>
                  // dataInfo(),
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Going())),
              child: CircleAvatar(
                child: Icon(Icons.notifications_outlined),
                backgroundColor: Colors.transparent,
                radius: 26,
                foregroundColor: Colors.white,
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              height: geth(53),
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
              height: geth(39),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: kTextGet8,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigation(1))),
                  child: Text(
                    'See all',
                    style: kTextJourney22,
                  ),
                )
              ],
            ),
            SizedBox(
              height: geth(10),
            ),
            SizedBox(height: geth(77), child: Buit()),
            SizedBox(
              height: geth(25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saved',
                  style: kTextGet8,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delicious())),
                  child: Text(
                    'See all',
                    style: kTextJourney22,
                  ),
                )
              ],
            ),
            SizedBox(
              height: geth(13),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.24,
              child: Built(),
            ),
            DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      // indicator: Colors.white,
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      indicatorWeight: 1.5,
                      tabs: [
                        Tab(
                          child: Text(
                            'Popular',
                            style: kTextJourney26,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Breakfast',
                            style: kTextJourney26,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Lunch',
                            style: kTextJourney26,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Dinner',
                            style: kTextJourney26,
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: geth(500),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TabBarView(
                        children: [
                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 3,
                                    mainAxisSpacing: 5),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Flexible(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: getw(176),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            child: Image.asset(
                                                'images/past.png',
                                                fit: BoxFit.contain),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          Positioned(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Fruits',
                                                  style: kTextJourney24,
                                                ),
                                                SmoothStarRating(
                                                  starCount: 5,
                                                  rating: 4,
                                                  size: 10,
                                                  color: Color(0xffffc107),
                                                  borderColor:
                                                      Color(0xffffc107),
                                                ),
                                                Text(
                                                  'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                  style: kTextJourney35,
                                                )
                                              ],
                                            ),
                                            bottom: 15,
                                            left: 15,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: geth(20),
                                    ),
                                    Stack(
                                      children: [
                                        SizedBox(
                                          width: getw(176),
                                          child: ClipRRect(
                                            child: Image.asset(
                                                'images/burger.png',
                                                fit: BoxFit.contain),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        Positioned(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Burger',
                                                style: kTextJourney24,
                                              ),
                                              SmoothStarRating(
                                                starCount: 5,
                                                rating: 4,
                                                size: 10,
                                                color: Color(0xffffc107),
                                                borderColor: Color(0xffffc107),
                                              ),
                                              Text(
                                                'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                style: kTextJourney35,
                                              )
                                            ],
                                          ),
                                          bottom: 15,
                                          left: 15,
                                        )
                                      ],
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                ),
                              );
                            },
                          ),
                          ListView(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: getw(176),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                child: Image.asset(
                                                    'images/past.png',
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              Positioned(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Fruits',
                                                      style: kTextJourney24,
                                                    ),
                                                    SmoothStarRating(
                                                      starCount: 5,
                                                      rating: 4,
                                                      size: 10,
                                                      color: Color(0xffffc107),
                                                      borderColor:
                                                          Color(0xffffc107),
                                                    ),
                                                    Text(
                                                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                      style: kTextJourney35,
                                                    )
                                                  ],
                                                ),
                                                bottom: 15,
                                                left: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        SizedBox(
                                          width: getw(176),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                child: Image.asset(
                                                    'images/fruit.png',
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              Positioned(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Eggless Crepes',
                                                      style: kTextJourney24,
                                                    ),
                                                    SmoothStarRating(
                                                      starCount: 5,
                                                      rating: 4,
                                                      size: 10,
                                                      color: Color(0xffffc107),
                                                      borderColor:
                                                          Color(0xffffc107),
                                                    ),
                                                    Text(
                                                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                      style: kTextJourney35,
                                                    )
                                                  ],
                                                ),
                                                bottom: 15,
                                                left: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        SizedBox(
                                          width: getw(176),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                child: Image.asset(
                                                    'images/fruit.png',
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              Positioned(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Eggless Crepes',
                                                      style: kTextJourney24,
                                                    ),
                                                    SmoothStarRating(
                                                      starCount: 5,
                                                      rating: 4,
                                                      size: 10,
                                                      color: Color(0xffffc107),
                                                      borderColor:
                                                          Color(0xffffc107),
                                                    ),
                                                    Text(
                                                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                      style: kTextJourney35,
                                                    )
                                                  ],
                                                ),
                                                bottom: 15,
                                                left: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        SizedBox(
                                          width: getw(176),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                child: Image.asset(
                                                    'images/fruit.png',
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              Positioned(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Eggless Crepes',
                                                      style: kTextJourney24,
                                                    ),
                                                    SmoothStarRating(
                                                      starCount: 5,
                                                      rating: 4,
                                                      size: 10,
                                                      color: Color(0xffffc107),
                                                      borderColor:
                                                          Color(0xffffc107),
                                                    ),
                                                    Text(
                                                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                      style: kTextJourney35,
                                                    )
                                                  ],
                                                ),
                                                bottom: 15,
                                                left: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                  'images/fruit.png',
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Eggless Crepes',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                  'images/past.png',
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Fruits',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                  'images/fruit.png',
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Eggless Crepes',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                  'images/fruit.png',
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Eggless Crepes',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                            ],
                          ),
                          ListView(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: getw(176),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                child: Image.asset(
                                                    'images/past.png',
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              Positioned(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Fruits',
                                                      style: kTextJourney24,
                                                    ),
                                                    SmoothStarRating(
                                                      starCount: 5,
                                                      rating: 4,
                                                      size: 10,
                                                      color: Color(0xffffc107),
                                                      borderColor:
                                                          Color(0xffffc107),
                                                    ),
                                                    Text(
                                                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                      style: kTextJourney35,
                                                    )
                                                  ],
                                                ),
                                                bottom: 15,
                                                left: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        Stack(
                                          children: [
                                            SizedBox(
                                              width: getw(176),
                                              child: ClipRRect(
                                                child: Image.asset(
                                                    'images/burger.png',
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Burger',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                  'images/fruit.png'),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Eggless Crepes',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                  'images/pasta1.png'),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Pasta',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                              SizedBox(
                                height: geth(24),
                              ),
                              Text(
                                'Suggested meal \nfor lunch',
                                style: kTextJourney36,
                              ),
                              SizedBox(
                                height: geth(37),
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            SizedBox(
                                              width: getw(176),
                                              child: ClipRRect(
                                                child: Image.asset(
                                                    'images/burger1.png',
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Burger',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        Stack(
                                          children: [
                                            SizedBox(
                                              width: getw(176),
                                              child: ClipRRect(
                                                child: Image.asset(
                                                    'images/burger2.png',
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Burger',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                  'images/burger3.png',
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Burger',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                  'images/burger4.png',
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Burger',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                            ],
                          ),
                          ListView(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: getw(176),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                child: Image.asset(
                                                    'images/past.png',
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              Positioned(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Fruits',
                                                      style: kTextJourney24,
                                                    ),
                                                    SmoothStarRating(
                                                      starCount: 5,
                                                      rating: 4,
                                                      size: 10,
                                                      color: Color(0xffffc107),
                                                      borderColor:
                                                          Color(0xffffc107),
                                                    ),
                                                    Text(
                                                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                      style: kTextJourney35,
                                                    )
                                                  ],
                                                ),
                                                bottom: 15,
                                                left: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        SizedBox(
                                          width: getw(176),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                child: Image.asset(
                                                    'images/fruit.png',
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              Positioned(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Eggless Crepes',
                                                      style: kTextJourney24,
                                                    ),
                                                    SmoothStarRating(
                                                      starCount: 5,
                                                      rating: 4,
                                                      size: 10,
                                                      color: Color(0xffffc107),
                                                      borderColor:
                                                          Color(0xffffc107),
                                                    ),
                                                    Text(
                                                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                      style: kTextJourney35,
                                                    )
                                                  ],
                                                ),
                                                bottom: 15,
                                                left: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        SizedBox(
                                          width: getw(176),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                child: Image.asset(
                                                    'images/fruit.png',
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              Positioned(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Eggless Crepes',
                                                      style: kTextJourney24,
                                                    ),
                                                    SmoothStarRating(
                                                      starCount: 5,
                                                      rating: 4,
                                                      size: 10,
                                                      color: Color(0xffffc107),
                                                      borderColor:
                                                          Color(0xffffc107),
                                                    ),
                                                    Text(
                                                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                      style: kTextJourney35,
                                                    )
                                                  ],
                                                ),
                                                bottom: 15,
                                                left: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        SizedBox(
                                          width: getw(176),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                child: Image.asset(
                                                    'images/fruit.png',
                                                    fit: BoxFit.contain),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              Positioned(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Eggless Crepes',
                                                      style: kTextJourney24,
                                                    ),
                                                    SmoothStarRating(
                                                      starCount: 5,
                                                      rating: 4,
                                                      size: 10,
                                                      color: Color(0xffffc107),
                                                      borderColor:
                                                          Color(0xffffc107),
                                                    ),
                                                    Text(
                                                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                      style: kTextJourney35,
                                                    )
                                                  ],
                                                ),
                                                bottom: 15,
                                                left: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                  'images/fruit.png',
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Eggless Crepes',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                  'images/past.png',
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Fruits',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: geth(20),
                                        ),
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                  'images/fruit.png',
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Eggless Crepes',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                  'images/fruit.png',
                                                  fit: BoxFit.contain),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            Positioned(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Eggless Crepes',
                                                    style: kTextJourney24,
                                                  ),
                                                  SmoothStarRating(
                                                    starCount: 5,
                                                    rating: 4,
                                                    size: 10,
                                                    color: Color(0xffffc107),
                                                    borderColor:
                                                        Color(0xffffc107),
                                                  ),
                                                  Text(
                                                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing \nelit. Aliquam ',
                                                    style: kTextJourney35,
                                                  )
                                                ],
                                              ),
                                              bottom: 15,
                                              left: 15,
                                            )
                                          ],
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              initialIndex: 0,
            )
          ],
        ),
      ),
      drawerDragStartBehavior: DragStartBehavior.start,
      drawer: App(),
    );
  }
}

class Buit extends StatelessWidget {
  // const Buit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CategoryController>(
      builder: ((controller) => ListView.builder(
            shrinkWrap: true,
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
            physics: ClampingScrollPhysics(),
          )),
    );
  }
}

class Built extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double geth(double h) {
      return MediaQuery.of(context).size.height * (h / 858.16);
    }

    double getw(double w) {
      return MediaQuery.of(context).size.width * (w / 433.84);
    }

    return GetX<RatingController>(
        builder: ((controllers) => ListView.builder(
              itemBuilder: (context, index) => Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlaceOrder()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff0c0c0c),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                    Image.asset(controllers.rates[index].pic)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              controllers.rates[index].title,
                              style: kTextJourney23,
                            ),
                            SizedBox(
                              height: getw(10),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RatingBar.builder(
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  itemCount: 5,
                                  ignoreGestures: true,
                                  unratedColor: Color(0xffc4c4c4),
                                  itemSize: 15,
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                  initialRating: controllers.rates[index].rating
                                      .toDouble(),
                                ),
                                SizedBox(
                                  width: getw(10),
                                ),
                                Text(
                                  '(100)',
                                  style: kTextJourney25,
                                ),
                                SizedBox(
                                  width: getw(70),
                                ),
                                Text(
                                  controllers.rates[index].amount,
                                  style: kTextJourney24,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              itemCount: controllers.rates.length,
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
            )));
  }
}
