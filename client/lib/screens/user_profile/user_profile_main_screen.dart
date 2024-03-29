import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/util/constants.dart';
import 'package:client/screens/setting_screen/main_setting_page.dart';
import 'package:client/screens/user_profile/user_profile_components/exp_bar_graph.dart';
import 'package:client/screens/user_profile/user_profile_components/pie_chart_container.dart';
import 'package:client/screens/user_profile/user_profile_components/user_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/user_profile_controller.dart';
import '../../util/connection_lost.dart';
import '../../util/screen_dimension.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfileController userProfileController =
        Get.put(UserProfileController());

    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

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
            padding: EdgeInsets.only(right: width * 0.02),
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
                  const UserProfileHeader(),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
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
                                    padding: EdgeInsets.only(top: height * 0.01),
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
                                  SizedBox(
                                    height: height * 0.01,
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
                                              width: width * 0.1,
                                              height: height * 0.1,
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
                                  SizedBox(
                                    height: height * 0.01, // 1% of screen height
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
                                    },
                                  ),
                                  SizedBox(
                                    height: height * 0.01, // 1% of screen height
                                  ),
                                  Divider(
                                    color: Colors.black.withOpacity(0.15),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(width * 0.05), // 5% of screen width
                                    child: SizedBox(
                                      height: height * 0.35,
                                      child: const BarGraph(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02, // 2% of screen height
                            ),
                            const PieChartContainer(),
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