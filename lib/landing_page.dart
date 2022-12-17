// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print, missing_return

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_recipes/bottom_navigation.dart';
import 'package:food_recipes/controller/category_controller.dart';
import 'package:food_recipes/controller/rating_controller.dart';
import 'package:food_recipes/provider/recipe_provider.dart';
import 'package:food_recipes/view/place_order.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'constants.dart';
import 'delicious.dart';
import 'drawer.dart';
import 'notification.dart';

final uid = FirebaseAuth.instance.currentUser?.uid;

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final controller = Get.put(CategoryController());
  final controllers = Get.put(RatingController());
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    dataInfo();
    changeProfile();
    pic();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RecipeProvider>().fetchFoods();
      context.read<RecipeProvider>().fetchFoods1();
      context.read<RecipeProvider>().fetchFoods2();
      context.read<RecipeProvider>().fetchFoods3();
    });
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
        print(loggedInUser?.email);
      }
    } catch (e) {
      print(e);
    }
  }

  DocumentSnapshot? snapshot;

  void getData() async {
    DocumentReference docref = await FirebaseFirestore.instance
        .collection('account details')
        .doc(_auth.currentUser?.uid);
    var him = docref.id;
    // snapshot = data as DocumentSnapshot<Object>;
  }

  void dataInfo() async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection('account details')
        .doc(uid)
        .get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
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
    return Text('');
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
              _key.currentState?.openDrawer();
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
              'Welcome ${_auth.currentUser?.displayName}!',
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
                  onTap: () {
                    // =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Delicious(),
                      ),
                    );
                  },
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
              height: MediaQuery.of(context).size.height * 0.34,
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
                      child: Consumer<RecipeProvider>(
                          builder: (context, provide, _) {
                        int selected = 0;
                        if (provide.foods.isNotEmpty) {
                          return TabBarView(
                            children: [
                              GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 3,
                                        mainAxisSpacing: 1),
                                itemCount: provide.foods.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      selected = index;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlaceOrder(
                                            provide.foods[selected],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Flexible(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: getw(176),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  child: Image.network(
                                                    provide.foods[index].image,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                Positioned(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: getw(120),
                                                        child: Text(
                                                          provide.foods[index]
                                                              .name,
                                                          style: kTextJourney24,
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      ),
                                                      SmoothStarRating(
                                                        starCount: 5,
                                                        rating: provide
                                                            .foods[index]
                                                            .ratings
                                                            .toDouble(),
                                                        size: 15,
                                                        // color: Color(0xff222222),
                                                        color:
                                                            Color(0xffffc107),
                                                        borderColor:
                                                            Color(0xffffc107),
                                                      ),
                                                      Text(
                                                        provide.foods[index]
                                                            .description,
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
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 1,
                                ),
                                itemCount: provide.foods1.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      selected = index;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlaceOrder(
                                            provide.foods1[selected],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Flexible(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: getw(176),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  child: Image.network(
                                                    provide.foods1[index].image,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                Positioned(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: getw(120),
                                                        child: Text(
                                                          provide.foods1[index]
                                                              .name,
                                                          style: kTextJourney24,
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      ),
                                                      SmoothStarRating(
                                                        starCount: 5,
                                                        rating: provide
                                                            .foods1[index]
                                                            .ratings
                                                            .toDouble(),
                                                        size: 15,
                                                        // color: Color(0xff222222),
                                                        color:
                                                            Color(0xffffc107),
                                                        borderColor:
                                                            Color(0xffffc107),
                                                      ),
                                                      Text(
                                                        provide.foods1[index]
                                                            .description,
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
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 3,
                                        mainAxisSpacing: 1),
                                itemCount: provide.foods2.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      selected = index;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PlaceOrder(
                                                  provide.foods2[selected])));
                                    },
                                    child: Flexible(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: getw(176),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  child: Image.network(
                                                    provide.foods2[index].image,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                Positioned(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: getw(120),
                                                        child: Text(
                                                          provide.foods2[index]
                                                              .name,
                                                          style: kTextJourney24,
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      ),
                                                      SmoothStarRating(
                                                        starCount: 5,
                                                        rating: provide
                                                            .foods2[index]
                                                            .ratings
                                                            .toDouble(),
                                                        size: 15,
                                                        // color: Color(0xff222222),
                                                        color:
                                                            Color(0xffffc107),
                                                        borderColor:
                                                            Color(0xffffc107),
                                                      ),
                                                      Text(
                                                        provide.foods2[index]
                                                            .description,
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
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 1,
                                ),
                                itemCount: provide.foods3.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      selected = index;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlaceOrder(
                                            provide.foods3[selected],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Flexible(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: getw(176),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  child: Image.network(
                                                    provide.foods3[index].image,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                Positioned(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: getw(120),
                                                        child: Text(
                                                          provide.foods3[index]
                                                              .name,
                                                          style: kTextJourney24,
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      ),
                                                      SmoothStarRating(
                                                        starCount: 5,
                                                        rating: provide
                                                            .foods3[index]
                                                            .ratings
                                                            .toDouble(),
                                                        size: 15,
                                                        // color: Color(0xff222222),
                                                        color:
                                                            Color(0xffffc107),
                                                        borderColor:
                                                            Color(0xffffc107),
                                                      ),
                                                      Text(
                                                        provide.foods3[index]
                                                            .description,
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
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        } else {
                          return CircularProgressIndicator(
                            value: 0.2,
                          );
                        }
                      }),
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

    int selectedIndex = 0;

    return Consumer<RecipeProvider>(builder: (context, snapshot, _) {
      if (snapshot.foods.isEmpty) {
        return CircularProgressIndicator();
      }
      return ListView.builder(
        itemBuilder: (context, index) => Row(
          children: [
            InkWell(
              onTap: () {
                selectedIndex = index;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PlaceOrder(snapshot.foods[selectedIndex])));
              },
              child: Container(
                width: getw(250),
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
                          child: Image.network(
                            snapshot.foods[index].image,
                            fit: BoxFit.contain,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.foods[index].name,
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
                            initialRating:
                                snapshot.foods[index].ratings.toDouble(),
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
                            snapshot.foods[index].price.toString(),
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
        itemCount: snapshot.foods.length,
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
      );
    });
  }
}
