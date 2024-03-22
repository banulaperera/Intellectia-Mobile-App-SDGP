import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/screens/setting_screen/change_password.dart';
import 'package:client/screens/setting_screen/quiz_preference_setting.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import 'account_setting.dart';

class MainSettingPage extends StatelessWidget {
  const MainSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        scrolledUnderElevation: 0.0,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: appBarTitleSize,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 25,
          right: 25,
        ),
        child: ListView(
          children: [
            const Row(
              children: [
                Icon(
                  BootstrapIcons.person,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Account',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 15,
            ),
            buildAccountSettingOption(
                context, 'Edit Profile', const AccountSetting()),
            buildAccountSettingOption(
                context, 'Change Password', ChangePassword()),
            buildAccountSettingOption(
                context, 'Quiz Preference', const GoalSetting()),
            buildAccountSettingOption(
                context, 'Privacy and security', const AccountSetting()),
            const SizedBox(
              height: 50,
            ),
            const Row(
              children: [
                Icon(
                  BootstrapIcons.bell,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 15,
            ),
            buildNotificationOption('Video recommendations'),
            buildNotificationOption('New quiz reminder'),
            buildNotificationOption('Skill up notifications'),
            const SizedBox(
              height: 50,
            ),
            const Row(
              children: [
                Icon(
                  BootstrapIcons.info_circle_fill,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'About Us',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 15,
            ),
            buildAccountSettingOption(
                context, 'About us', const AccountSetting()),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Sign out',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOption(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: Switch(
              value: true,
              activeTrackColor: kPrimaryColor,
              onChanged: (bool value) {}),
        )
      ],
    );
  }

  GestureDetector buildAccountSettingOption(
      BuildContext context, String title, Widget widget) {
    return GestureDetector(
      onTap: () {
        Get.to(() => widget);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              BootstrapIcons.chevron_right,
              color: Colors.grey[600],
            )
          ],
        ),
      ),
    );
  }
}
