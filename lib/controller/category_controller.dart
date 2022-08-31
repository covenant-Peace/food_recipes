// ignore_for_file: prefer_const_constructors

import 'package:food_recipes/model/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var cats = <CategoryModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCats();
  }

  void fetchCats() async {
    await Future.delayed(Duration(seconds: 1));
    var catResult = [
      CategoryModel('images/salad.png', 'Salad'),
      CategoryModel('images/veggies.png', 'Veggies'),
      CategoryModel('images/localmeal.png', 'Local Meal'),
      CategoryModel('images/western.png', 'Western'),
      CategoryModel('images/salad.png', 'Salad'),
      CategoryModel('images/veggies.png', 'Veggies'),
      CategoryModel('images/localmeal.png', 'Local Meal'),
      CategoryModel('images/western.png', 'Western'),
    ];
    cats.value = catResult;
  }
}
