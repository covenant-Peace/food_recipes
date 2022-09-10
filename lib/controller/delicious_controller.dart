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
        id: 'images/del.png',
        foodDescription:
        'Get fresh prepared fruit salad with different flavours..',
        foodName: 'Fruit Salad',
        price: 800.00,
      ),
      Deli(
        id: 'images/del.png',
        foodDescription:
        'Get fresh prepared fruit salad with different flavours..',
        foodName: 'Fruit Salad',
        price: 500.00,
      ),
      Deli(
        id: 'images/del.png',
        foodDescription:
        'Get fresh prepared fruit salad with different flavours',
        foodName: 'Fruit Salad',
        price: 200.00,
      ),
      Deli(
        id: 'images/del.png',
        foodDescription:
        'Get fresh prepared fruit salad with different flavours',
        foodName: 'Fruit Salad',
        price: 600.00,
      ),
    ];
    dels.value = delResult;
  }
}
