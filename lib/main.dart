import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/homescreen.dart';
import 'package:food_recipes/provider/recipe_provider.dart';
import 'package:food_recipes/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return appRoot;
  }

  Widget get appRoot => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => RecipeProvider(),
          ),
          ChangeNotifierProvider(create: (_) => UserProvider())
        ],
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // title: AppStrings.appName,
            // themeMode: themeProvider.themeMode,
            // theme: MyThemes.ligthTheme,
            // darkTheme: MyThemes.darkTheme,
            // initialRoute: SplashScreen.routeName,
            // onGenerateRoute: route.controller,
            home: HomeScreen(),
          );
        },
      );
}
