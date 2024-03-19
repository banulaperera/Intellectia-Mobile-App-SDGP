
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:flutter/Material.dart';

class InputTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool obscuredProperty;
  final TextEditingController controller;
  const InputTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.obscuredProperty, required this.controller,
  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 35,
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscuredProperty ? isObscured : false,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor)),
          suffixIcon: widget.obscuredProperty
              ? IconButton(
                  onPressed: () {
                    setState(
                      () {
                        isObscured = !isObscured;
                      },
                    );
                  },
                  icon: isObscured
                      ? const Icon(BootstrapIcons.eye_slash_fill)
                      : const Icon(BootstrapIcons.eye_fill),
                )
              : null,
          contentPadding: const EdgeInsets.only(bottom: 5),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          labelStyle: Theme.of(context).textTheme.titleMedium,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w100, color: Colors.black),
        ),
      ),
    );
  }
}
