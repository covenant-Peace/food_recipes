import 'package:get/get.dart';
import 'package:food_recipes/model/food.dart';

class NumberController extends GetxController {
  var quantityItems = <Food>[].obs;

  int get count =>quantityItems.length;
  addToCart(var food) {
    quantityItems.add(food);
  }


  removeFromCart(var food) {
    quantityItems.remove(food);
  }

}