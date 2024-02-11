import 'package:client/constants.dart';
import 'package:client/signup_page.dart';
import 'package:client/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'login_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _currentNavigationIndex = 0;

  //Testing data
  final pages = [
    const LoginPage(),
    const SignupPage(),
    const SplashScreen(),
    const Text('data')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentNavigationIndex],
        bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentNavigationIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      selectedFontSize: 13,
      selectedIconTheme: const IconThemeData(size: 30, shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 25.0)],),
      unselectedIconTheme: const IconThemeData(size: 23),
      backgroundColor: kPrimaryColor,
      elevation: 10,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Iconsax.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.cup),
          label: 'Goal',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.notification),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.user),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentNavigationIndex = index;
        });
      },
    ));
  }
}
