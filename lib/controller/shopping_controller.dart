// ignore_for_file: prefer_const_constructors

import 'package:food_recipes/model/food.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var foods = List<Food>().obs;

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
        id: 1,
        foodDescription:
            'Get fresh prepared fruit salad with different flavours..',
        foodName: 'Fruit Salad',
        price: 800,
      ),
      Food(
        id: 2,
        foodDescription:
            'Get fresh prepared fruit salad with different flavours..',
        foodName: 'Fruit Salad',
        price: 500,
      ),
      Food(
        id: 3,
        foodDescription:
            'Get fresh prepared fruit salad with different flavours',
        foodName: 'Fruit Salad',
        price: 200,
      ),
      Food(
        id: 4,
        foodDescription:
            'Get fresh prepared fruit salad with different flavours',
        foodName: 'Fruit Salad',
        price: 600,
      ),
    ];
    foods.value = foodResult;
  }
}
