import 'package:client/constants.dart';
import 'package:client/screens/setting_screen/setting_screen_components/input_textfield_widget.dart';
import 'package:client/screens/setting_screen/setting_screen_components/profile_image.dart';
import 'package:client/screens/user_profile/user_profile_main_screen.dart';
import 'package:flutter/Material.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        scrolledUnderElevation: 0.0,
        title: const Text(
          'Edit Profile',
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
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Center(
                child: ProfileImage(),
              ),
              const SizedBox(
                height: 35,
              ),
              const InputTextField(
                labelText: 'First Name',
                hintText: 'Banula',
                obscuredProperty: false,
              ),
              const InputTextField(
                labelText: 'Last Name',
                hintText: 'Perera',
                obscuredProperty: false,
              ),
              const InputTextField(
                labelText: 'Email',
                hintText: 'banulaperera@hc.com',
                obscuredProperty: false,
              ),
              const InputTextField(
                labelText: 'Password',
                hintText: '************',
                obscuredProperty: true,
              ),
              const InputTextField(
                labelText: 'Confirm Password',
                hintText: '************',
                obscuredProperty: true,
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomButton(kBackgroundColor, 'CANCEL', Colors.black),
                  bottomButton(kPrimaryColor, ' SAVE ', kBackgroundColor),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  OutlinedButton bottomButton(
      Color backgroundColor, String text, Color textColor) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          elevation: 5),
      onPressed: () {
        if (text == 'CANCEL') {
          Navigator.pop(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const UserProfile();
              },
            ),
          );
        }
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 14, letterSpacing: 2, color: textColor),
      ),
    );
  }
}
