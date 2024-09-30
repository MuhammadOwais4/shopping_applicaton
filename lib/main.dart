import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_applicaton/providers/cart_provider.dart';
import 'package:shopping_applicaton/screens/shopping_app.dart';
//Provider
//ChangeNotifierProvider
//FutureProvider
//StreamProvider

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: MaterialApp(
      title: "Shopping App",
      theme: ThemeData(
        fontFamily: "Lato",
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
      home: const ShoppingApp(),
    ),
  ));
}
