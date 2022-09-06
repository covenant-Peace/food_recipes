// ignore_for_file: prefer_const_constructors

import 'package:food_recipes/model/salad_model.dart';
import 'package:get/get.dart';

class Salad2Controller extends GetxController {
  var sals = <SaladModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchSals();
  }

  void fetchSals() async {
    await Future.delayed(Duration(seconds: 1));
    var salResult = [
      SaladModel('images/vegy.png', 'Veggies'),
      SaladModel('images/gluten.png', 'Gluten Free'),
      SaladModel('images/vegan.png', 'Vegan'),
      SaladModel('images/vegy.png', 'Veggies'),
      SaladModel('images/gluten.png', 'Gluten Free'),
      SaladModel('images/vegan.png', 'Vegan'),
      SaladModel('images/vegy.png', 'Veggies'),
      SaladModel('images/gluten.png', 'Gluten Free'),
      SaladModel('images/vegan.png', 'Vegan'),
    ];
    sals.value = salResult;
  }
}
