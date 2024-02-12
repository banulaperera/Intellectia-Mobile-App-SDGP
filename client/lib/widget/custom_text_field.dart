import 'package:flutter/Material.dart';
import '../constants.dart';

class LoginSignUpTextField extends StatelessWidget {
  const LoginSignUpTextField({super.key, required  this.hintText, required this.keyboardType});

  final String hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
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
}
