import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:client/controllers/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});


  final userProfileController = Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
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
              child: Obx(() => TextFormField(
                controller: userProfileController.existingPasswordController,
                style: const TextStyle(color: Colors.black),
                obscureText: userProfileController.obscureText,
                decoration: InputDecoration(
                  helperText: 'Enter your current password',
                  helperStyle: const TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                    icon: userProfileController.obscureText
                        ? const Icon(BootstrapIcons.eye_fill)
                        : const Icon(BootstrapIcons.eye_slash_fill),
                    onPressed: () {
                      userProfileController.isObscureText();
                    },
                  ),
                ),
              ),)
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
              child: Obx(() => TextFormField(
                controller: userProfileController.passwordController,
                style: const TextStyle(color: Colors.black),
                obscureText: userProfileController.obscureText,
                decoration: InputDecoration(
                  helperText: 'Must be at least 8 characters.',
                  helperStyle: const TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                      icon: userProfileController.obscureText
                          ? const Icon(BootstrapIcons.eye_fill)
                          : const Icon(BootstrapIcons.eye_slash_fill),
                      onPressed: () {
                        userProfileController.isObscureText();
                      }),
                ),
              ),)
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
              child: Obx(() => TextFormField(
                controller: userProfileController.confirmPasswordController,
                style: const TextStyle(color: Colors.black),
                obscureText: userProfileController.obscureText,
                decoration: InputDecoration(
                  helperText: 'Both passwords must match.',
                  helperStyle: const TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                      icon: userProfileController.obscureText
                          ? const Icon(BootstrapIcons.eye_fill)
                          : const Icon(BootstrapIcons.eye_slash_fill),
                      onPressed: () {
                        userProfileController.isObscureText();
                      }),
                ),
              ),)
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
              ),
              onPressed: () {
                userProfileController.changePassword(context);
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
