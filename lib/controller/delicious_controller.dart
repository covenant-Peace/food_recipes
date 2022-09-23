// ignore_for_file: prefer_const_constructors

import 'package:food_recipes/model/food.dart';
import 'package:get/get.dart';

import '../model/deli.dart';

class DeliciousController extends GetxController {
  var dels = <Deli>[].obs;

  // var fill = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDels();
  }

  void fetchDels() async {
    await Future.delayed(Duration(seconds: 1));
    var delResult = [
      Deli(
        id: 'images/plate.png',
        foodDescription:
        'Get fresh prepared fruit salad with different flavours..',
        foodName: 'Fruit Salad',
        price: 800.00,
      ),
      Deli(
        id: 'images/del.png',
        foodDescription:
        'Get fresh prepared fruit salad with different flavours..',
        foodName: 'Sardine Bread',
        price: 500.00,
      ),
      Deli(
        id: 'images/del.png',
        foodDescription:
        'Get fresh prepared Ogbono soup with different flavours',
        foodName: 'Ogbono',
        price: 200.00,
      ),
      Deli(
        id: 'images/del.png',
        foodDescription:
        'Get fresh prepared fruit salad with different flavours',
        foodName: 'Fruit Salad',
        price: 600.00,
      ),
      Deli(
        id: 'images/del.png',
        foodDescription:
        'Get fresh prepared igbo made bitter leaf soup',
        foodName: 'Ofe Onugbu',
        price: 2000.00,
      ),
      Deli(
        id: 'images/del.png',
        foodDescription:
        'Get fresh prepared fruit salad with different flavours',
        foodName: 'Fruit Salad',
        price: 1600.00,
      ),
    ];
    dels.value = delResult;
  }
}
