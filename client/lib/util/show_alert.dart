import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/main.dart';
import 'package:flutter/material.dart';


  showError(message){
  final snackBar = SnackBar(
    content: Container(
      // padding: EdgeInsets.all(12),
      height: 45,
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            weight: 150,
            BootstrapIcons.x_circle,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(width: 25),
          Text(
            message,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    ),
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
}

showSuccess(message){
  final snackBar = SnackBar(
    content: Container(
      // padding: EdgeInsets.all(12),
      height: 45,
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            weight: 150,
            BootstrapIcons.check2_circle,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(width: 25),
          Text(
            message,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    ),
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
}