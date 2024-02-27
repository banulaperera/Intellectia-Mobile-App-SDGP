import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:client/screens/setting_screen/account_setting.dart';
import 'package:client/screens/setting_screen/goal_setting.dart';
import 'package:client/screens/user_profile/user_profile_components/exp_bar_graph.dart';
import 'package:client/screens/user_profile/user_profile_components/pie_chart_container.dart';
import 'package:client/screens/user_profile/user_profile_components/user_profile_header.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      // builder: (context) => const AccountSetting()),
                      builder: (context) => const GoalSetting()),
                );
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
      body: Column(
        children: [
          const UserProfileHeader(),
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
                      width: 400,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Colors.black.withOpacity(0.15)),
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
                          SizedBox(
                            width: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  BootstrapIcons.lightning_fill,
                                  color: Colors.orangeAccent,
                                ),
                                Text(
                                  '21000',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey.shade700),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.grey.shade700),
                                children: [
                                  const TextSpan(text: 'You have gain '),
                                  TextSpan(
                                      text: '4000 Xp',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey.shade700)),
                                  const TextSpan(text: ' than yesterday.'),
                                ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.black.withOpacity(0.15),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: SizedBox(
                              height: 200,
                              child: BarGraph(),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const PieChartContainer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
