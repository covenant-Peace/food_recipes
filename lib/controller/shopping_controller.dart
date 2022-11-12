// ignore_for_file: prefer_const_constructors

import 'package:food_recipes/model/food.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var foods = <Food>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFoods();
  }

  void fetchFoods() async {
    await Future.delayed(Duration(seconds: 1));
    var foodResult = [
      Food(
        description:
            'Get fresh prepared fruit salad with different flavours..',
        name: 'Fruit Salad',
      ),
      Food(
        description:
            'Get fresh prepared fruit salad with different flavours..',
        name: 'Fruit Salad',
      ),
      Food(
        description:
            'Get fresh prepared fruit salad with different flavours',
        name: 'Fruit Salad',
      ),
      Food(
        description:
            'Get fresh prepared fruit salad with different flavours',
        name: 'Fruit Salad',
      ),
    ];
    foods.value = foodResult;
  }
}
