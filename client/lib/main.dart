import 'package:client/constants.dart';
import 'package:client/signup_page.dart';
import 'package:client/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intellectia',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
