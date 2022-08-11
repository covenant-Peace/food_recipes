import 'package:flutter/material.dart';
import 'package:food_recipes/bottom_navigation.dart';
import 'journey.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:splash_screen_view/splash_screen_view.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: BottomNavigation(),
      duration: 9000,
      backgroundColor: Color(0xFF222222),
      imageSrc: 'images/home.png',
      pageRouteTransition: PageRouteTransition.SlideTransition,
    );
  }
}
