import 'package:flutter/material.dart';
import 'package:flutter_food_ordering/pages/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_ANON_KEY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ordering',
      theme: ThemeData(
        colorSchemeSeed: Colors.lightGreen,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.lightGreen,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}