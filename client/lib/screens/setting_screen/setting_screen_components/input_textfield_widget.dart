import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/util/constants.dart';
import 'package:flutter/Material.dart';

import '../../../util/screen_dimension.dart';

class InputTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool obscuredProperty;
  final TextEditingController controller;

  const InputTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.obscuredProperty,
    required this.controller,
  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

    return Padding(
      padding: EdgeInsets.only(
        bottom: height * 0.035, // 3.5% of screen height
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
          contentPadding: EdgeInsets.only(bottom: height * 0.005),
          // 0.5% of screen height
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          labelStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: width * 0.04),
          // 4% of screen width
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontSize: width * 0.04, // 4% of screen width
              fontWeight: FontWeight.w100,
              color: Colors.black),
        ),
      ),
    );
  }
}
