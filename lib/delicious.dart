// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipes/model/food.dart';
import 'package:food_recipes/view/description.dart';

import 'constants.dart';
import 'drawer.dart';

enum Foods {
  salad,
  vegetables,
  soup,
}

double buyingPrice = 0;

class Delicious extends StatefulWidget {
  // const Delicious({Key? key}) : super(key: key);

  @override
  State<Delicious> createState() => _DeliciousState();
}

class _DeliciousState extends State<Delicious> {
  final GlobalKey<ScaffoldState> _gkey = GlobalKey<ScaffoldState>();
  Foods chosen = Foods.salad;

  @override
  Widget build(BuildContext context) {
    double getH(double i) {
      return (i / 926) * MediaQuery.of(context).size.height;
    }

    double getW(double j) {
      return (j / 428) * MediaQuery.of(context).size.width;
    }

    Widget grealish() {
      if (chosen == Foods.salad) {
        return Foden();
      } else if (chosen == Foods.soup) {
        return Text(
          'Coming Soon',
          style: TextStyle(color: Colors.white),
        );
      } else if (chosen == Foods.vegetables) {
        return Text(
          'Coming Soon',
          style: TextStyle(color: Colors.white),
        );
      }
      return Text('');
    }

    return Scaffold(
      key: _gkey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 35),
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
      drawer: App(),
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chosen = Foods.salad;
                    });
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
                      color: chosen == Foods.salad
                          ? Color(0xFFEDA92E)
                          : Color(0xfff2f2f2),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Salads',
                      style: kTextJourney29,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: getW(5),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chosen = Foods.vegetables;
                    });
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
                      color: chosen == Foods.vegetables
                          ? Color(0xFFEDA92E)
                          : Color(0xfff2f2f2),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Vegetables',
                      style: kTextJourney29,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: getW(5),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chosen = Foods.soup;
                    });
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
                      color: chosen == Foods.soup
                          ? Color(0xFFEDA92E)
                          : Color(0xfff2f2f2),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Soup',
                      style: kTextJourney29,
                      textAlign: TextAlign.center,
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
            ),
            Expanded(child: grealish())
          ],
        ),
      ),
    );
  }
}

class Foden extends StatelessWidget {
  // const Foden({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('food')
            .doc('popular')
            .collection('Breakfast')
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) {
              int selected = 0;
              // buyingPrice = controller.dels[index].price;
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      selected = index;
                      Food model = Food(
                        image: snapshot.data.docs[selected]['image'],
                        typeOfFood: snapshot.data.docs[selected]['typeOfFood'],
                        price: snapshot.data.docs[selected]['price'],
                        servingTime: snapshot.data.docs[selected]
                            ['servingTime'],
                        toServe: snapshot.data.docs[selected]['toServe'],
                        name: snapshot.data.docs[selected]['name'],
                        description: snapshot.data.docs[selected]
                            ['description'],
                        servingNumber: snapshot.data.docs[selected]
                            ['servingNumber'],
                        ingredient: snapshot.data.docs[selected]['ingredient'],
                        kcal: snapshot.data.docs[selected]['kcal'],
                        direction: snapshot.data.docs[selected]['direction'],
                        ratings: snapshot.data.docs[selected]['ratings'],
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            model,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            child: Image.network(
                              snapshot.data!.docs[index]['image'],
                              height: 84,
                              width: 75,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: 1,
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              child: Text(
                                snapshot.data!.docs[index]['name'],
                                style: kTextJourney31,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              width: 170,
                              child: Text(
                                snapshot.data!.docs[index]['description'],
                                style: kTextJourney30,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'NGN${snapshot.data!.docs[index]['price']}',
                              style: kTextJourney32,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '(128)',
                              style: kTextJourney30,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Colors.white,
                              size: 15,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: Color(0xff6a6a6a),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              );
            },
            itemCount: snapshot.data!.docs.length,
          );
        });
  }
}
