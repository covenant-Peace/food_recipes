




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/services/auth_service.dart';

import '../model/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final AUthService _authMethods = AUthService();

  UserModel get getUser {
    return _user!;
  }

  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }

  final List<UserModel> _users = [];

  List<UserModel> get users => _users;

  getAllUsers() {
    final snap = FirebaseFirestore.instance.collection('users').snapshots();

    snap.listen((event) {
      _users.clear();
      for (var element in event.docs) {
        _users.add(
          UserModel.fromMap(
            element.data(),
          ),
        );
      }
      notifyListeners();
    });
  }
}