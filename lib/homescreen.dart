// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:food_recipes/journey.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: JourneyScreen(),
      duration: 9000,
      backgroundColor: Color(0xFF222222),
      imageSrc: 'images/home.png',
      pageRouteTransition: PageRouteTransition.SlideTransition,
    );
  }
}
