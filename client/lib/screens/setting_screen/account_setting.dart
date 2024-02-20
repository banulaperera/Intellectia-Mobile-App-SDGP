import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:client/screens/setting_screen/setting_screen_components/input_textfield_widget.dart';
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
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/logo_image.jpeg'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          shape: BoxShape.circle,
                          color: kPrimaryColor,
                        ),
                        child: Icon(
                          BootstrapIcons.pencil_fill,
                          size: 17,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const InputTextFeild(
                labelText: 'First Name',
                hintText: 'Banula',
                obscuredProperty: false,
              ),
              const InputTextFeild(
                labelText: 'Last Name',
                hintText: 'Perera',
                obscuredProperty: false,
              ),
              const InputTextFeild(
                labelText: 'Email',
                hintText: 'banulaperera@hc.com',
                obscuredProperty: false,
              ),
              const InputTextFeild(
                labelText: 'Password',
                hintText: '************',
                obscuredProperty: true,
              ),
              const InputTextFeild(
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
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        elevation: 5),
                    onPressed: () {},
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(
                          fontSize: 14, letterSpacing: 2, color: Colors.black),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        elevation: 5),
                    onPressed: () {},
                    child: const Text(
                      'SAVE',
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2,
                          color: kBackgroundColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
