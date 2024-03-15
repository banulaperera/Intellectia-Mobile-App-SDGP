import 'dart:typed_data';

import 'package:client/constants.dart';
import 'package:client/controllers/user_profile_controller.dart';
import 'package:client/screens/setting_screen/setting_screen_components/input_textfield_widget.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../util/image_picker.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  final userProfileController = Get.find<UserProfileController>();

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
                    _image != null
                        ? Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 10),
                                ),
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: MemoryImage(_image!),
                              ),
                            ),
                          )
                        : Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 10),
                                ),
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    userProfileController.user.photo,
                                  )),
                            ),
                          ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: selectImage,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: Icon(
                            Icons.add_a_photo,
                            size: 17,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              InputTextField(
                controller: firstNameController,
                labelText: 'First Name',
                hintText: userProfileController.user.firstName,
                obscuredProperty: false,
              ),
              const SizedBox(
                height: 35,
              ),
              InputTextField(
                controller: lastNameController,
                labelText: 'Last Name',
                hintText: userProfileController.user.lastName,
                obscuredProperty: false,
              ),
              const SizedBox(
                height: 35,
              ),
              InputTextField(
                controller: emailController,
                labelText: 'Email',
                hintText: userProfileController.user.email,
                obscuredProperty: false,
              ),
              const SizedBox(
                height: 35,
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
          Navigator.pop(context);
        } else {
          final userProfileController = Get.find<UserProfileController>();
          userProfileController.updateUser(firstNameController.text,
              lastNameController.text, emailController.text);
          Navigator.pop(context);
        }
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 14, letterSpacing: 2, color: textColor),
      ),
    );
  }
}
