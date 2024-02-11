import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(6, 126, 191, 1);
const kBackgroundColor = Colors.white;

OutlineInputBorder focusedBoarder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black, width: 2.5),
    borderRadius: BorderRadius.circular(60.0),
  );
}

Widget button({required String label, required VoidCallback onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontSize: 18,
          letterSpacing: 3,
        ),
      ),
    ),
  );
}

Widget textField(
    {required String hintText, required TextInputType keyboardType}) {
  return TextField(
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        letterSpacing: 2,
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Colors.black, style: BorderStyle.none),
        borderRadius: BorderRadius.circular(60),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kPrimaryColor, width: 2.5),
        borderRadius: BorderRadius.circular(60),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
    ),
    keyboardType: keyboardType,
  );
}