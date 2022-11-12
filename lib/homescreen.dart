// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/bottom_navigation.dart';
import 'package:food_recipes/journey.dart';
import 'package:food_recipes/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  void _navigateHome() async {
    User user;
    String emaill;
    try {
      UserProvider userProvider = Provider.of(context, listen: false);

      await userProvider.refreshUser();
      user = FirebaseAuth.instance.currentUser;
      emaill = user.email;
    } catch (e) {
      user = null;
    }

    await Future.delayed(const Duration(milliseconds: 1500), () {
      emaill != null
          ? Navigator.push(context,
              MaterialPageRoute(builder: (context) => BottomNavigation(0)))
          : Navigator.push(context,
              MaterialPageRoute(builder: (context) => JourneyScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: Center(
        child: AnimatedSize(
          duration: const Duration(microseconds: 6000),
          child: Image.asset('images/home.png'),
        ),
      ),
    );
  }
}
