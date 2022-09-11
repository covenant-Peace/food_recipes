// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_recipes/bottom_navigation.dart';
import 'package:food_recipes/controller/category_controller.dart';
import 'package:food_recipes/controller/rating_controller.dart';
import 'package:food_recipes/notification.dart';
import 'package:food_recipes/sign_up.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'delicious.dart';
import 'drawer.dart';

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
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }
  // String namee(){
  //   if(_auth.currentUser.displayName != null){
  //     return _auth.currentUser.displayName;
  //   }
  //   else{
  //     return SignUpScreenState().text.text;
  //   }
  // }
Widget pic(){
    if(_auth.currentUser.photoURL != null){
      return Image.network(_auth.currentUser.photoURL);
    }
    else{
      return Image.asset('images/girl.png');
    }
}
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      key: _key,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () => _key.currentState.openDrawer(),
            child: CircleAvatar(
              child: pic(),
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
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Going())),
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
        padding: const EdgeInsets.only(left: 39, right: 30),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(
            //       children: [
            //         CircleAvatar(
            //           child: Image.asset('images/girl.png'),
            //         ),
            //         SizedBox(
            //           width: 16,
            //         ),
            //         Text(
            //           'Welcome Hafeez!',
            //           style: kTextGet8,
            //         ),
            //       ],
            //     ),
            //     GestureDetector(
            //       onTap: () => Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => Going())),
            //       child: CircleAvatar(
            //         child: Icon(Icons.notifications_outlined),
            //         backgroundColor: Colors.transparent,
            //         radius: 26,
            //         foregroundColor: Colors.white,
            //       ),
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: 42,
            // ),
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
              height: 10,
            ),
            SizedBox(height: 77, child: Buit()),
            SizedBox(
              height: 25,
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
              height: 13,
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
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TabBarView(
                        children: [
                          ListView(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: Image.asset('images/fruit.png'),
                                        width: 120,
                                        // height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          // image: DecorationImage(image: ImageProvider)
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        child:
                                            Image.asset('images/eggless.png'),
                                        width: 120,
                                      ),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        child: Image.asset('images/fruit2.png'),
                                        width: 120,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        child: Image.asset('images/past.png'),
                                        width: 120,
                                      )
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                  )
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                              ),
                            ],
                          ),
                          //Center(child: Text('Not Available')),
                          Center(
                              child: Text(
                            'Not Available',
                            style: kTextJourney24,
                          )),
                          Center(
                              child:
                                  Text('Not Available', style: kTextJourney24)),
                          Center(
                              child:
                                  Text('Not Available', style: kTextJourney24)),
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
      // drawerEnableOpenDragGesture: false,
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
              // controller: ScrollController(),
              // padding: EdgeInsets.only(left: 10, right: 10),
            )));
  }
}

class Built extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<RatingController>(
        builder: ((controllers) => ListView.builder(
              itemBuilder: (context, index) => Row(
                children: [
                  Container(
                    // height: 160,
                    // width:300,
                    decoration: BoxDecoration(
                      color: Color(0xff0c0c0c),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(controllers.rates[index].pic),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            controllers.rates[index].title,
                            style: kTextJourney23,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
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
                                    initialRating: controllers
                                        .rates[index].rating
                                        .toDouble(),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '(100)',
                                    style: kTextJourney25,
                                  )
                                ],
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
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              itemCount: controllers.rates.length,
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              // controller: ScrollController(),
              // padding: EdgeInsets.only(left: 10, right: 10),
            )));
  }
}
