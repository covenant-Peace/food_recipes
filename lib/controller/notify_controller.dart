// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';

import '../model/notify.dart';

class NotifyController extends GetxController {
  // ignore: prefer_collection_literals
  var notes = <Notify>[].obs;
  var fish = true.obs;

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
          'Card was unable to be charged from due \nto issue from the card **** **** 2317 for \nthe delivery fee',
          'images/warn.svg',
          // CircleAvatar(
          //   radius: 4,
          //   backgroundColor: Color(0xffeda92e),
          // ),
          '17:23'),
      Notify(
          'Payment successful',
          'Order from cart was successfully \ncharged from **** **** 2317',
          'images/warn.svg',
          // SizedBox(
          //   width: 1,
          // ),
          '17:23'),
      Notify(
          'New recipe added',
          'Avocado Sauce recipe has been added  to the \nlist and currently has 20+ reviews \nfrom users already',
          'images/delete.svg',
          // CircleAvatar(
          //   radius: 4,
          //   backgroundColor: Color(0xffeda92e),
          // ),
          '17:23'),
      Notify(
          'New recipe added',
          'Ofada Sauce recipe has been added \nand currently has 10+ reviews from users already',
          'images/delete.svg',
          // CircleAvatar(
          //   radius: 4,
          //   backgroundColor: Color(0xffeda92e),
          // ),
          '17:23'),
      Notify(
          'Order to be delivered',
          'Order successfully sent out  \nand delivery will be in take 20 mins ',
          'images/bike.svg',
          // CircleAvatar(
          //   radius: 4,
          //   backgroundColor: Color(0xffeda92e),
          // ),
          '6 days'),
      Notify(
          'New recipe added',
          'Ofada Sauce recipe has been added and \ncurrently has 10+ reviews from users already',
          'images/delete.svg',
          // CircleAvatar(
          //   radius: 4,
          //   backgroundColor: Color(0xffeda92e),
          // ),
          '8 days'),
      Notify(
          'New recipe added',
          'Avocado Sauce recipe has been added \nto the list and currently has 20+ \nreviews from users already',
          'images/delete.svg',
          // CircleAvatar(
          //   radius: 4,
          //   backgroundColor: Color(0xffeda92e),
          // ),
          '17:23'),
    ];
    notes.value = noteResult;
  }
}
