import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/controllers/user_profile_controller.dart';
import 'package:client/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/screen_dimension.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final userProfileController = Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.075), // 7.5% of screen width
        child: ListView(
          children: [
            SizedBox(
              height: height * 0.02, // 2% of screen height
            ),
            Text(
              'Create new password',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontSize: width * 0.05), // 5% of screen width
            ),
            SizedBox(
              height: height * 0.02, // 2% of screen height
            ),
            Text(
              'Your new password must be different from previous used passwords.',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: width * 0.04), // 4% of screen width
            ),
            SizedBox(
              height: height * 0.02, // 2% of screen height
            ),
            Text(
              'Existing Password',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: width * 0.04), // 4% of screen width
            ),
            SizedBox(
              height: height * 0.005, // 0.5% of screen height
            ),
            SizedBox(
                height: height * 0.0875, // 8.75% of screen height
                child: Obx(
                  () => TextFormField(
                    controller:
                        userProfileController.existingPasswordController,
                    style: const TextStyle(color: Colors.black),
                    obscureText: userProfileController.obscureText,
                    decoration: InputDecoration(
                      helperText: 'Enter your current password',
                      helperStyle: TextStyle(fontSize: width * 0.035),
                      // 3.5% of screen width
                      suffixIcon: IconButton(
                        icon: userProfileController.obscureText
                            ? const Icon(BootstrapIcons.eye_fill)
                            : const Icon(BootstrapIcons.eye_slash_fill),
                        onPressed: () {
                          userProfileController.isObscureText();
                        },
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: height * 0.02, // 2% of screen height
            ),
            Text(
              'Password',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: width * 0.04), // 4% of screen width
            ),
            SizedBox(
              height: height * 0.005, // 0.5% of screen height
            ),
            SizedBox(
                height: height * 0.0875, // 8.75% of screen height
                child: Obx(
                  () => TextFormField(
                    controller: userProfileController.passwordController,
                    style: const TextStyle(color: Colors.black),
                    obscureText: userProfileController.obscureText,
                    decoration: InputDecoration(
                      helperText: 'Must be at least 8 characters.',
                      helperStyle: TextStyle(fontSize: width * 0.035),
                      // 3.5% of screen width
                      suffixIcon: IconButton(
                          icon: userProfileController.obscureText
                              ? const Icon(BootstrapIcons.eye_fill)
                              : const Icon(BootstrapIcons.eye_slash_fill),
                          onPressed: () {
                            userProfileController.isObscureText();
                          }),
                    ),
                  ),
                )),
            SizedBox(
              height: height * 0.02, // 2% of screen height
            ),
            Text(
              'Confirm Password',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: width * 0.04), // 4% of screen width
            ),
            SizedBox(
              height: height * 0.005, // 0.5% of screen height
            ),
            SizedBox(
                height: height * 0.0875, // 8.75% of screen height
                child: Obx(
                  () => TextFormField(
                    controller: userProfileController.confirmPasswordController,
                    style: const TextStyle(color: Colors.black),
                    obscureText: userProfileController.obscureText,
                    decoration: InputDecoration(
                      helperText: 'Both passwords must match.',
                      helperStyle: TextStyle(fontSize: width * 0.035),
                      // 3.5% of screen width
                      suffixIcon: IconButton(
                          icon: userProfileController.obscureText
                              ? const Icon(BootstrapIcons.eye_fill)
                              : const Icon(BootstrapIcons.eye_slash_fill),
                          onPressed: () {
                            userProfileController.isObscureText();
                          }),
                    ),
                  ),
                )),
            SizedBox(
              height: height * 0.05, // 5% of screen height
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
              ),
              onPressed: () {
                userProfileController.changePassword(context);
              },
              child: Text(
                'Change Password',
                style: TextStyle(
                    fontSize: width * 0.05,
                    color: kBackgroundColor), // 5% of screen width
              ),
            ),
          ],
        ),
      ),
    );
  }
}
