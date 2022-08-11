// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:food_recipes/journey.dart';
import 'package:food_recipes/log_in.dart';
import 'package:food_recipes/passwordFile/forgot_password.dart';
import 'package:food_recipes/paymentFile/payment.dart';
import 'package:food_recipes/sign_up.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = <Widget>[
    JourneyScreen(),
    SignUpScreen(),
    LoginScreen(),
    PaymentScreen(),
    ForgotPassword(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF222222),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Color(0xFFBDBDBD),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: 'Category'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined),
              label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        children: pages,
        index: selectedIndex,
      ),
    );
  }
}
