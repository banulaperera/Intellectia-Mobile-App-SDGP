import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:client/screens/home_page.dart';
import 'package:client/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';

import 'notification_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});
  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _currentNavigationIndex = 0;

//Testing data

  final pages = [
    const HomePage(),
    const Text('data'),
    const NotificationScreen(),
    const UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentNavigationIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentNavigationIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
          selectedFontSize: 13,
          selectedIconTheme: const IconThemeData(size: 30, color: Colors.white),
          unselectedIconTheme:
              const IconThemeData(size: 25, color: Colors.black45),
          backgroundColor: kPrimaryColor,
          elevation: 10,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(BootstrapIcons.house_fill),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(BootstrapIcons.bullseye),
              label: 'Goal',
            ),
            BottomNavigationBarItem(
              icon: Icon(BootstrapIcons.bell_fill),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(BootstrapIcons.person_fill),
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
