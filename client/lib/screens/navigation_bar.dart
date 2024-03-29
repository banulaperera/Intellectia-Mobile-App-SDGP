import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/util/constants.dart';
import 'package:client/screens/home_page/home_page.dart';
import 'package:client/screens/quiz/welcome/welcome_screen.dart';
import 'package:client/screens/user_profile/user_profile_main_screen.dart';
import 'package:flutter/material.dart';
import '../util/screen_dimension.dart';
import 'notification_page/notification_page.dart';

class BottomNavigation extends StatefulWidget {
  final int screenNumber;
  const BottomNavigation(this.screenNumber, {super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _currentNavigationIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentNavigationIndex = widget.screenNumber;
  }

  final screens = [
    const HomePage(),
    const WelcomeScreen(),
    const NotificationScreen(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenDimensions.init(context);
    double width = ScreenDimensions.screenWidth;
    double selectedIconSize = width < 400 ? 25 : 30;
    double unselectedIconSize = width < 400 ? 20 : 25;

    return Scaffold(
      body: screens[_currentNavigationIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentNavigationIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 13,
        selectedIconTheme: IconThemeData(size: selectedIconSize, color: Colors.white),
        unselectedIconTheme: IconThemeData(size: unselectedIconSize, color: Colors.black45),
        backgroundColor: kPrimaryColor,
        elevation: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.house_fill),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.bullseye),
            label: 'Quiz',
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
      ),
    );
  }
}