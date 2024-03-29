import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';

class CustomSnackBar {
  static void showError(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15), // Set your desired padding for title
        child: Text(title),
      ),
      messageText: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15), // Set your desired padding for message
        child: Text(message),
      ),
      colorText: Colors.black,
      backgroundColor: Colors.red.shade400,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(30),
    );
  }

  static void showSuccess(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15), // Set your desired padding for title
        child: Text(title),
      ),
      messageText: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15), // Set your desired padding for message
        child: Text(message),
      ),
      icon: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Icon(BootstrapIcons.info_circle_fill, color: Colors.black),
      ),
      colorText: Colors.black,
      backgroundColor: Colors.green.shade400,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(30),
    );
  }
}