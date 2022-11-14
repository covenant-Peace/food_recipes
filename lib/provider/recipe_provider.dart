import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/food.dart';

class RecipeProvider extends ChangeNotifier {
  final List<Food> _foods = [];
  Map chosenFood = {};
  final List<Food> _chosenRecipe = [];

  List<Food> get recipesBought => _chosenRecipe;

  List<Food> get foods => _foods;
  int quantity = 0;
  double totalAmount = 0;

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

  void addToCart(String? userId, Food model) async {
    final snap = FirebaseFirestore.instance
        .collection('cart')
        .doc(userId)
        .collection('myOrderedFoods')
        .doc();

    final docId = snap.id;

    await snap.set(model.copyWith(uid: docId, quantity: quantity).toMap());
    notifyListeners();
    // snap.add({
    //   'name' : model.name,
    //   'image' : model.image,
    //   'description' : model.description,
    //   'amount' : amount,
    //   'quantity' : quantity,
    // });
  }

  fetchCart(String? userId) {
    final snapshot = FirebaseFirestore.instance
        .collection('cart')
        .doc(userId)
        .collection('myOrderedFoods')
        // .orderBy('typeOfFood')
        .snapshots();

    snapshot.listen((event) {
      _chosenRecipe.clear();
      for (var element in event.docs) {
        _chosenRecipe.add(
          Food.fromMap(
            element.data(),
          ),
        );
      }
      notifyListeners();
    });
  }

  void deleteFood(Food model, String? userId) async {
    // _isLoading = true;
    notifyListeners();
    final cart = FirebaseFirestore.instance
        .collection('cart')
        .doc(userId)
        .collection('myOrderedFoods');

    await cart.doc(model.uid).delete();
    // Future.delayed(const Duration(seconds: 4));
    notifyListeners();
  }
}
