// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/notify.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotifyController extends GetxController {
  // ignore: prefer_collection_literals
  var notes = List<Notify>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFoods();
  }

  void fetchFoods() async {
    await Future.delayed(Duration(seconds: 1));
    var noteResult = [
      Notify(
          'Payment Unsuccessful',
          'Card was unable to be charged from due to issue from the card **** **** 2317 for the delivery fee',
          SvgPicture.asset('images/warn.svg'),
          CircleAvatar(
            radius: 4,
            backgroundColor: Color(0xffeda92e),
          ),
          '17:23'),
      Notify(
          'Payment successful',
          'Order from cart was successfully charged from **** **** 2317',
          SvgPicture.asset('images/warn.svg'),
          SizedBox(
            width: 1,
          ),
          '17:23'),

      Notify(
          'New recipe added',
          'Avocado Sauce recipe has been added  to the list and currently has 20+ reviews from users already',
          SvgPicture.asset('images/warn.svg'),
          CircleAvatar(
            radius: 4,
            backgroundColor: Color(0xffeda92e),
          ),
          '17:23'),
    ];
    notes.value = noteResult;
  }
}
