import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/food.dart';

class RecipeProvider extends ChangeNotifier {
  final List<Food> _foods = [];
  Map chosenFood = {};
  bool _isLoading = false;

  List<Food> get foods => _foods;

  // void getChosenFood(Food model) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   final savedCardDoc = await FirebaseFirestore.instance
  //       .collection('food')
  //       .doc('popular')
  //       .collection('Breakfast')
  //       .doc(model.)
  //       .get();
  //
  //   chosenCard = (savedCardDoc.data() as dynamic);
  //   modelling = CardModel(
  //     cardName: chosenCard['cardName'],
  //     cardNumber: chosenCard['cardNumber'],
  //     cvc: chosenCard['cvc'],
  //     mm: chosenCard['mm'],
  //     yy: chosenCard['yy'],
  //     date: chosenCard['date'],
  //   );
  //   _isLoading = false;
  //   notifyListeners();
  // }

  fetchCards() {
    final snapshot = FirebaseFirestore.instance
        .collection('food')
        .doc('popular')
        .collection('Breakfast')
        // .orderBy('typeOfFood')
        .snapshots();

    snapshot.listen((event) {
      _foods.clear();
      for (var element in event.docs) {
        _foods.add(
          Food.fromMap(
            element.data(),
          ),
        );
      }
      notifyListeners();
    });
  }
}
