import 'package:flutter/material.dart';
import 'package:flutter_recipe_list/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'food recipe',
      theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home: const HomePage(),
    );
  }
}
