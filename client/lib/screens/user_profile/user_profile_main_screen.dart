import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:client/screens/setting_screen/main_setting_page.dart';
import 'package:client/screens/user_profile/user_profile_components/exp_bar_graph.dart';
import 'package:client/screens/user_profile/user_profile_components/pie_chart_container.dart';
import 'package:client/screens/user_profile/user_profile_components/user_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/user_profile_controller.dart';
import '../../util/connection_lost.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfileController userProfileController =
    Get.put(UserProfileController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        scrolledUnderElevation: 0.0,
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: appBarTitleSize,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Get.to(() => const MainSettingPage());
              },
              child: const Row(
                children: [
                  Icon(
                    BootstrapIcons.gear_wide_connected,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: kPrimaryColor,
        onRefresh: () async {
          await userProfileController.fetchUser();
        },
        child: FutureBuilder(
          future: userProfileController.fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: connectionLost(),
              );
            } else {
              return Column(
                children: [
                  UserProfileHeader(),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: Colors.black.withOpacity(0.15)),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'XP Earned',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey.shade600),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GetBuilder<UserProfileController>(
                                    builder: (controller) {
                                      return SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Lottie.asset(
                                              'animations/Animation - 1709314319942.json',
                                              width: 35,
                                              height: 35,
                                            ),
                                            Text(
                                              controller.user.totalXP
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.grey.shade700),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GetBuilder<UserProfileController>(
                                    builder: (controller) {
                                      return Text(
                                        userProfileController.xpDifferenceText,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: Colors.grey.shade700),
                                      );
                                      // return RichText(
                                      //   text: TextSpan(
                                      //       style: Theme.of(context)
                                      //           .textTheme
                                      //           .bodyLarge!
                                      //           .copyWith(
                                      //               color:
                                      //                   Colors.grey.shade700),
                                      //       children: [
                                      //         const TextSpan(
                                      //             text: 'You have gain '),
                                      //         TextSpan(
                                      //             text: '4000 Xp',
                                      //             // text: controller.user.weeklyXP.length > 0 ? (controller.user.weeklyXP[6] - controller.user.weeklyXP[5]).toString() : '0',
                                      //             style: Theme.of(context)
                                      //                 .textTheme
                                      //                 .titleMedium!
                                      //                 .copyWith(
                                      //                     fontWeight:
                                      //                         FontWeight.w700,
                                      //                     color: Colors
                                      //                         .grey.shade700)),
                                      //         const TextSpan(
                                      //             text: ' than yesterday.'),
                                      //       ]),
                                      // );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    color: Colors.black.withOpacity(0.15),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: SizedBox(
                                      height: 250,
                                      child: BarGraph(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PieChartContainer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
