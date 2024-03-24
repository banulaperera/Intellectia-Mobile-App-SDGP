import 'package:flutter/Material.dart';

import '../constants.dart';

class LoginScreenButton extends StatefulWidget {
  const LoginScreenButton(
      {super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  State<LoginScreenButton> createState() => _LoginScreenButtonState();
}

class _LoginScreenButtonState extends State<LoginScreenButton> {
  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isButtonPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isButtonPressed = false;
        });
      },
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: _isButtonPressed ? kPrimaryColor.withOpacity(0.8) : kPrimaryColor,
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
          widget.label,
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
}
