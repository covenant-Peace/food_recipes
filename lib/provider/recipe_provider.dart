import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/food.dart';

class RecipeProvider extends ChangeNotifier {
  final List<Food> _foods = [];
  final List<Food> _foods1 = [];
  final List<Food> _foods2 = [];
  final List<Food> _foods3 = [];

  Map chosenFood = {};
  final List<Food> _chosenRecipe = [];

  List<Food> get recipesBought => _chosenRecipe;

  List<Food> get foods => _foods;
  List<Food> get foods1 => _foods1;
  List<Food> get foods2 => _foods2;
  List<Food> get foods3 => _foods3;

  int quantity = 0;
  double totalAmount = 0;

  fetchFoods() {
    final snapshot = FirebaseFirestore.instance
        .collection('food')
        .doc('popular')
        .collection('Breakfast').where('typeOfFood', isEqualTo: 0)
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

  fetchFoods1() {
    final snapshot = FirebaseFirestore.instance
        .collection('food')
        .doc('popular')
        .collection('Breakfast').where('typeOfFood', isEqualTo: 1)
    // .orderBy('typeOfFood')
        .snapshots();

    snapshot.listen((event) {
      _foods1.clear();
      for (var element in event.docs) {
        _foods1.add(
          Food.fromMap(
            element.data(),
          ),
        );
      }
      notifyListeners();
    });
  }

  fetchFoods2() {
    final snapshot = FirebaseFirestore.instance
        .collection('food')
        .doc('popular')
        .collection('Breakfast').where('typeOfFood', isEqualTo: 2)
    // .orderBy('typeOfFood')
        .snapshots();

    snapshot.listen((event) {
      _foods2.clear();
      for (var element in event.docs) {
        _foods2.add(
          Food.fromMap(
            element.data(),
          ),
        );
      }
      notifyListeners();
    });
  }

  fetchFoods3() {
    final snapshot = FirebaseFirestore.instance
        .collection('food')
        .doc('popular')
        .collection('Breakfast').where('typeOfFood', isEqualTo: 3)
    // .orderBy('typeOfFood')
        .snapshots();

    snapshot.listen((event) {
      _foods3.clear();
      for (var element in event.docs) {
        _foods3.add(
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

  Map foodieCart = {};

  void addQuantity(Food model) async {
    await FirebaseFirestore.instance
        .collection('cart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('myOrderedFoods')
        .doc(model.uid)
        .update({'quantity': FieldValue.increment(1)});

    notifyListeners();
  }

  void subtractQuantity(Food model) async {
    if (model.quantity > 0) {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('myOrderedFoods')
          .doc(model.uid)
          .update({'quantity': FieldValue.increment(-1)});

      notifyListeners();
    }
    // notifyListeners();
  }
  int sum =0;

  total()async{
    final snap = await FirebaseFirestore.instance
        .collection('cart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('myOrderedFoods').get();

    for (var element in snap.docs) {
      int value = element.data()['price'] * element.data()['quantity'];
      sum = sum + value;
    }
    // notifyListeners();
    notifyListeners();
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
