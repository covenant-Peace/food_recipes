// ignore_for_file: prefer_const_constructors

import 'package:food_recipes/model/category_model.dart';
import 'package:food_recipes/model/salad_model.dart';
import 'package:get/get.dart';

class SaladController extends GetxController {
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
      SaladModel('images/salads.png', 'Salads'),
      SaladModel('images/soup.png', 'Soup'),
      SaladModel('images/salads2.png', 'Salads'),
      SaladModel('images/salads.png', 'Salads'),
      SaladModel('images/soup.png', 'Soup'),
      SaladModel('images/salads2.png', 'Salads'),
      SaladModel('images/salads.png', 'Salads'),
      SaladModel('images/soup.png', 'Soup'),
      SaladModel('images/salads2.png', 'Salads'),

    ];
    sals.value = salResult;
  }
}
