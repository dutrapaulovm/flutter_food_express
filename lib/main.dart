import 'package:flutter/material.dart';
import 'package:flutter_food_express/presentation/screen/estado/estado_search_screen.dart';
import 'package:flutter_food_express/presentation/screen/home_screen.dart';
import 'package:flutter_food_express/routes_names.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(     
      initialRoute: HomeScreen.routName, //Define a rota principal da
      routes: RoutesNames.routesNames, 
    );
  }
}

