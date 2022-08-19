import 'package:flutter/material.dart';

import 'journey.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JourneyScreen(),
      // initialRoute: HomeScreen.id,
      // routes: {
      //   SignUpScreen.id: (context) => SignUpScreen(),
      //   JourneyScreen.id: (context) => JourneyScreen(),
      // },
    );
  }
}
