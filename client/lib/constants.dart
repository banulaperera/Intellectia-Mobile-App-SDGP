import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(6, 126, 191, 1);
const kBackgroundColor = Colors.white;

OutlineInputBorder focusedBoarder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black, width: 2.5),
    borderRadius: BorderRadius.circular(60.0),
  );
}
