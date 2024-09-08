import 'package:flutter/material.dart';
import 'package:proposals/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proposal AI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 24, 54, 223), // Button color
            foregroundColor: Colors.white, // Text color
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
