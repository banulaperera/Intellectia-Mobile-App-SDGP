import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:client/controllers/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/show_Alert.dart';
import '../../setting_screen/main_setting_page.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isObscured = true;

  TextEditingController existingPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    existingPasswordController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileController = Get.find<UserProfileController>();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Create new password',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Your new password must be different from previous used passwords.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Existing Password',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 70,
              child: TextFormField(
                controller: existingPasswordController,
                style: const TextStyle(color: Colors.black),
                obscureText: _isObscured,
                decoration: InputDecoration(
                  helperText: 'Enter your current password',
                  helperStyle: const TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                    icon: _isObscured
                        ? const Icon(BootstrapIcons.eye_fill)
                        : const Icon(BootstrapIcons.eye_slash_fill),
                    onPressed: () {
                      setState(
                        () {
                          _isObscured = !_isObscured;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Password',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 70,
              child: TextFormField(
                controller: passwordController,
                style: const TextStyle(color: Colors.black),
                obscureText: _isObscured,
                decoration: InputDecoration(
                  helperText: 'Must be at least 8 characters.',
                  helperStyle: const TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                      icon: _isObscured
                          ? const Icon(BootstrapIcons.eye_fill)
                          : const Icon(BootstrapIcons.eye_slash_fill),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      }),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Confirm Password',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 70,
              child: TextFormField(
                controller: confirmPasswordController,
                style: const TextStyle(color: Colors.black),
                obscureText: _isObscured,
                decoration: InputDecoration(
                  helperText: 'Both passwords must match.',
                  helperStyle: const TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                      icon: _isObscured
                          ? const Icon(BootstrapIcons.eye_fill)
                          : const Icon(BootstrapIcons.eye_slash_fill),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      }),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
              ),
              onPressed: () {
                if (existingPasswordController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty) {
                  showError('All fields are required');
                } else {
                  if (passwordController.text ==
                      confirmPasswordController.text) {
                    userProfileController.changePassword(
                        existingPasswordController.text,
                        passwordController.text);
                    Get.to(() => const MainSettingPage());
                  } else {
                    showError('Passwords do not match');
                  }
                }
              },
              child: const Text(
                'Change Password',
                style: TextStyle(fontSize: 20, color: kBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
