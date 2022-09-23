// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';
import 'package:food_recipes/controller/pay_controller.dart';
import 'package:food_recipes/controller/shopping_controller.dart';
import 'package:food_recipes/payment_method.dart';
import 'package:get/get.dart';

import '../bottom_navigation.dart';

int debin;

class ShoppingPage extends StatelessWidget {
  final foodController = Get.put(ShoppingController());
  final payController = Get.put(PayController());

  @override
  Widget build(BuildContext context) {
    int deliveryFee = 499;

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
            GetX<ShoppingController>(
              builder: ((controller) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: controller.foods.length,
                      itemBuilder: (context, index) {
                        // final fill = payController.payItems[index];
                        return Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('images/plate.png'),
                                  SizedBox(
                                    width: 17.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${controller.foods[index].foodName}',
                                              style: kTextGet4,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  // payController.removeFromCart1(
                                                  //    fill.id,
                                                  //     fill.foodName,
                                                  //     fill.foodDescription,
                                                  //    fill.price);
                                                },
                                                child: Image.asset(
                                                    'images/close.png')),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 7.0,
                                        ),
                                        Text(
                                          '${controller.foods[index].foodDescription}',
                                          style: kTextGet5,
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
                                                          payController
                                                              .removeFromCart(
                                                                  controller
                                                                          .foods[
                                                                      index]);
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                          size: 10.0,
                                                        ),
                                                      ),
                                                      GetX<PayController>(
                                                          builder:
                                                              ((controller) {
                                                        return Text(
                                                            '${controller.count}');
                                                      })),
                                                      GestureDetector(
                                                        onTap: () {
                                                          payController
                                                              .addToCart(
                                                                  controller
                                                                          .foods[
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
                                            GetX<PayController>(
                                                builder: (controller) {
                                              return Text(
                                                'NGN ${controller.totalPrice}',
                                                style: kTextGet6,
                                              );
                                            })
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                      }),
                );
              }),
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
                    GetX<PayController>(builder: ((controller) {
                      return Text(
                        'NGN ${controller.totalPrice}',
                        style: kTextGet,
                      );
                    }))
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
            Container(
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
                GetX<PayController>(builder: ((controller) {
                  debin = deliveryFee + controller.totalPrice.toInt();
                  return Text(
                    'NGN $debin',
                    style: kTextGet2,
                  );
                })),
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
