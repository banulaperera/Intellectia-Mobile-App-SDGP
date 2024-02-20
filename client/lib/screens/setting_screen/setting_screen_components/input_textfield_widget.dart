import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/foundation.dart';

class InputTextFeild extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool obscuredProperty;
  const InputTextFeild({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.obscuredProperty,
  });

  @override
  State<InputTextFeild> createState() => _InputTextFeildState();
}

class _InputTextFeildState extends State<InputTextFeild> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 35,
      ),
      child: TextField(
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
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
    );
  }
}
