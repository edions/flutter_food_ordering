import 'package:flutter/material.dart';
import 'package:flutter_food_ordering/pages/login.dart';

void main() {
  runApp(MaterialApp(
    home: const LoginPage(),
    title: "Food Ordering",
    theme: ThemeData(
      primarySwatch: Colors.lightGreen,
    ),
    debugShowCheckedModeBanner: false,
  ));
}
