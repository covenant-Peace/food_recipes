import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/homescreen.dart';
import 'package:food_recipes/provider/recipe_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }

  Widget get appRoot => MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => RecipeProvider(),
        )
      ]);
}
