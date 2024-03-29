import 'package:client/util/constants.dart';
import 'package:client/controllers/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lottie/lottie.dart';

import '../../../util/screen_dimension.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userProfileController = Get.find<UserProfileController>();
    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

    return Container(
      width: double.infinity,
      height: height * 0.25,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: GetBuilder<UserProfileController>(builder: (builder) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: width * 0.15,
              minRadius: width * 0.15,
              backgroundColor: Colors.grey.shade800,
              backgroundImage: userProfileController.getImage(),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${userProfileController.user.firstName} ${userProfileController.user.lastName}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: kBackgroundColor,
                        fontSize: width * 0.045,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  userProfileController.user.email,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: width * 0.035,
                        color: kBackgroundColor,
                      ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Level ${userProfileController.user.level}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: width * 0.045, // 4.5% of screen width
                            color: kBackgroundColor,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 2,
                          ),
                    ),
                    Lottie.asset('animations/Animation - 1709315159426.json',
                        width: width * 0.225,
                        reverse: true, repeat: true),
                  ],
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}