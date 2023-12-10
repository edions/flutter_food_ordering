import 'package:flutter/material.dart';
import 'package:flutter_food_ordering/widgets/navigation.dart';

void main() {
  runApp(MaterialApp(
    home: const NavigationWidget(),
    title: "Food Ordering",
    theme: ThemeData(
      primarySwatch: Colors.lightGreen,
    ),
    debugShowCheckedModeBanner: false,
  ));
}
