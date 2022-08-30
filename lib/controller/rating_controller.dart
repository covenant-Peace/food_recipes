// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';

import '../model/rating_model.dart';

class RatingController extends GetxController {
  var rates = <RatingModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchRates();
  }

  void fetchRates() async {
    await Future.delayed(Duration(seconds: 1));
    var rateResult = [
      RatingModel('Crepes with Honey', 'NGN800', 3, 'images/crepes.png'),
      RatingModel('Pasta with Egg Sauce', 'NGN800', 4, 'images/past.png'),
      RatingModel('Crepes with Honey', 'NGN800', 5, 'images/crepes.png'),
    ];
    rates.value = rateResult;
  }
}
