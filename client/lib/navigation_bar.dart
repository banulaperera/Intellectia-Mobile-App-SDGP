import 'package:client/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
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
    ));
  }
}
