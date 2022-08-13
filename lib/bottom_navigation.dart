// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:food_recipes/journey.dart';
import 'package:food_recipes/log_in.dart';
import 'package:food_recipes/passwordFile/forgot_password.dart';
import 'package:food_recipes/paymentFile/payment.dart';
import 'package:food_recipes/sign_up.dart';
import 'package:food_recipes/view/description.dart';
import 'package:food_recipes/view/place_order.dart';
import 'package:food_recipes/view/shopping_page.dart';
import 'package:flutter_svg/svg.dart';

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
    Description(),
    PlaceOrder(),
    ShoppingPage(),
    LoginScreen(),
    PaymentScreen(),
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
              icon: SvgPicture.asset('images/Home.svg'), label: 'Home', activeIcon: SvgPicture.asset('images/Home.svg', color: Colors.orange,)),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('images/category.svg'), label: 'Category', activeIcon: SvgPicture.asset('images/category.svg', color: Colors.orange,)),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/cart.svg'),
            label: 'Cart',
              activeIcon: SvgPicture.asset('images/cart.svg', color: Colors.orange,)
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('images/notification.svg'),
              label: 'Notification', activeIcon: SvgPicture.asset('images/notification.svg', color: Colors.orange,)),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('images/account.svg'), label: 'Account', activeIcon: SvgPicture.asset('images/account.svg', color: Colors.orange,)),
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
