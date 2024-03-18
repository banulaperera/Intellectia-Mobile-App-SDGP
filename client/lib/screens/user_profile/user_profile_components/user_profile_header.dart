import 'package:client/constants.dart';
import 'package:client/controllers/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lottie/lottie.dart';

class UserProfileHeader extends StatelessWidget {
  UserProfileHeader({
    super.key,
  });

  final userProfileController = Get.find<UserProfileController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: 75,
            minRadius: 75,
            backgroundColor: Colors.grey.shade800,
            backgroundImage: const AssetImage('assets/blank_user_image.png'),
          ),
          const SizedBox(
            width: 20,
          ),
          GetBuilder<UserProfileController>(
            builder: (builder) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${userProfileController.user.firstName} ${userProfileController.user.lastName}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: kBackgroundColor,
                          fontSize: 18,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userProfileController.user.email,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14.0,
                          color: kBackgroundColor,
                        ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // const SizedBox(
                      //   width: 2,
                      // ),
                      Text(
                        'Level ${userProfileController.user.level}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 18.0,
                              color: kBackgroundColor,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 2,
                            ),
                      ),
                      Lottie.asset('animations/Animation - 1709315159426.json',
                          width: 90, height: 90, reverse: true, repeat: true),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
