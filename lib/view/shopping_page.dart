// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';
import 'package:food_recipes/payment_method.dart';
import 'package:food_recipes/provider/recipe_provider.dart';
import 'package:provider/provider.dart';

import '../bottom_navigation.dart';

int debin = 0;

class ShoppingPage extends StatefulWidget {
  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<RecipeProvider>()
          .fetchCart(FirebaseAuth.instance.currentUser?.uid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int deliveryFee = 499;

    double getH(double i) {
      return (i / 926) * MediaQuery.of(context).size.height;
    }

    double getW(double j) {
      return (j / 428) * MediaQuery.of(context).size.width;
    }

    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: Padding(
        padding: const EdgeInsets.only(top: 35, left: 36, right: 34),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
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
                Text(
                  'My Order',
                  style: kTextJourney11,
                ),
                SizedBox(
                  width: 8.0,
                ),
              ],
            ),
            Expanded(
              child: Consumer<RecipeProvider>(
                // stream: FirebaseFirestore.instance
                //     .collection('cart')
                //     .doc(FirebaseAuth.instance.currentUser?.uid)
                //     .collection('myOrderedFoods')
                //     .snapshots(),
                builder: ((context, snapshot, _) {
                  // if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.recipesBought.length,
                      itemBuilder: (context, index) {
                        // context.read<RecipeProvider>().totalAmount = ;
                        return GestureDetector(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    child: SizedBox(
                                      width: getW(75),
                                      child: Image.network(
                                          snapshot.recipesBought[index].image),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  SizedBox(
                                    width: 17.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            child: Text(
                                              '${snapshot.recipesBought[index].name}',
                                              style: kTextGet4,
                                            ),
                                            width: getW(188),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<RecipeProvider>()
                                                  .deleteFood(
                                                    snapshot
                                                        .recipesBought[index],
                                                    FirebaseAuth.instance
                                                        .currentUser?.uid,
                                                  );
                                            },
                                            child:
                                                Image.asset('images/close.png'),
                                          ),
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                      SizedBox(
                                        height: 7.0,
                                      ),
                                      SizedBox(
                                        child: Text(
                                          '${snapshot.recipesBought[index].description}',
                                          style: kTextGet5,
                                        ),
                                        width: getW(230),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Quantity  ',
                                                style: kTextGet5,
                                              ),
                                              Container(
                                                height: 17.0,
                                                width: 37.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  color: Colors.grey,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                RecipeProvider>()
                                                            .subtractQuantity(
                                                                snapshot.recipesBought[
                                                                    index]);
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: Colors.white,
                                                        size: 10.0,
                                                      ),
                                                    ),
                                                    Text(
                                                        '${snapshot.recipesBought[index].quantity}'),
                                                    GestureDetector(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                RecipeProvider>()
                                                            .addQuantity(snapshot
                                                                    .recipesBought[
                                                                index]);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 10.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'NGN ${snapshot.recipesBought[index].quantity * snapshot.recipesBought[index].price}',
                                            style: kTextGet6,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Divider(
                                thickness: 0.0,
                                color: Color(0xFF6A6A6A),
                              ),
                            ],
                          ),
                        );
                      });
                  // }
                  return const LinearProgressIndicator();
                }),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SubTotal',
                      style: kTextGet,
                    ),
                    Text(
                      'NGN 0',
                      style: kTextGet,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery fee',
                      style: kTextGet,
                    ),
                    Text(
                      'NGN$deliveryFee',
                      style: kTextGet,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Coupon code',
                          style: kTextGet,
                        ),
                        Icon(
                          Icons.warning_amber_outlined,
                          color: Color(0xFFE5E5E5),
                          size: 15,
                        ),
                      ],
                    ),
                    Text(
                      '_ _ _',
                      style: kTextGet,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            SizedBox(
              width: 300.0,
              child: Divider(
                thickness: 1.0,
                color: Color(0xFFE5E5E5),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: kTextGet1,
                ),
                // debin = deliveryFee + controller.totalPrice.toInt();
                Text(
                  'NGN $debin',
                  style: kTextGet2,
                )
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentMethod()));
              },
              child: Container(
                height: 56.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48.0),
                  color: Color(0xFFEDA92E),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Checkout',
                  style: kTextGet3,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
