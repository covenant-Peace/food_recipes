import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/food.dart';

class RecipeProvider extends ChangeNotifier {
  final List<Food> _foods = [];

  List<Food> get foods => _foods;

  fetchCards() {
    final snapshot = FirebaseFirestore.instance
        .collection('food')
        .doc('popular')
        .collection('Breakfast')
        .orderBy('typeOfFood')
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
