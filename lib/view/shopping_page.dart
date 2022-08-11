// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';
import 'package:food_recipes/controller/pay_controller.dart';
import 'package:food_recipes/controller/shopping_controller.dart';
import 'package:food_recipes/payment_method.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  final foodController = Get.put(ShoppingController());
  final payController = Get.put(PayController());

  @override
  Widget build(BuildContext context) {
    int deliveryFee = 499;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF222222),
        body: Column(
          children: [
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 26.0),
                    height: 20.0,
                    width: 20.0,
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.keyboard_arrow_left_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 58.0,
                ),
                Container(
                  height: 24.0,
                  width: 130.0,
                  alignment: Alignment.topCenter,
                  child: Text(
                    '           My Order',
                    style: kTextJourney11,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: GetX<ShoppingController>(
                builder: ((controller) {
                  return ListView.builder(
                      itemCount: controller.foods.length,
                      itemBuilder: (context, index) {
                        // final fill = payController.payItems[index];
                        return Container(
                          // elevation: 10.0,
                          // width: 1000.0,
                          color: Color(0xFF222222),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Expanded(
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
                                            Container(
                                              height: 40.0,
                                              width: 180.0,
                                              child: Text(
                                                '${controller.foods[index].foodDescription}',
                                                style: kTextGet5,
                                              ),
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
                                                        borderRadius: BorderRadius.circular(4.0),
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
                                                              builder: ((controller) {
                                                            return Text(
                                                                '${controller.count}');
                                                          })),
                                                          GestureDetector(
                                                            onTap: () {
                                                              payController.addToCart(
                                                                  controller
                                                                      .foods[index]);
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
                            ),
                          ),
                        );
                      });
                }),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 36.0, right: 34.0),
              child: Column(
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
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              width: 300.0,
              margin: EdgeInsets.only(left: 36.0, right: 34.0),
              child: Divider(
                thickness: 1.0,
                color: Color(0xFFE5E5E5),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 36.0, right: 34.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: kTextGet1,
                  ),
                  GetX<PayController>(builder: ((controller) {
                    return Text(
                      'NGN ${deliveryFee + controller.totalPrice}',
                      style: kTextGet2,
                    );
                  })),
                ],
              ),
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
                width: 341.0,
                height: 56.0,
                margin: EdgeInsets.only(left: 44.0, right: 43.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
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
