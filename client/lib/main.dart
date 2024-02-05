import 'package:client/constats.dart';
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
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/undraw_taking_notes_re_bnaf (1) 1.png"),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Expanded(
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Intellectia\n",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontFamily: 'Poppins',
                              letterSpacing: 5,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: "'Where education made effortless and fun'",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              letterSpacing: 4,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
