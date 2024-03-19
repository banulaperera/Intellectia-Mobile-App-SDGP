import 'package:flutter/Material.dart';
import 'package:lottie/lottie.dart';

Column connectionLost() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Lottie.asset(
        'animations/Animation - 1710141039780.json',
        height: 250,
        reverse: true,
        repeat: true,
        animate: true,
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          textAlign: TextAlign.center,
          'Connection Lost',
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}
