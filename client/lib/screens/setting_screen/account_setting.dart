import 'dart:convert';
import 'package:client/util/constants.dart';
import 'package:client/controllers/user_profile_controller.dart';
import 'package:client/screens/setting_screen/setting_screen_components/input_textfield_widget.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../util/image_picker.dart';
import '../../util/screen_dimension.dart';

class AccountSetting extends StatefulWidget {

  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? _image;

  void selectImage() async {
    String? base64Image;
    final img = await pickImage(ImageSource.gallery);
    if(img!=null){
     base64Image=base64Encode(img);
    }

    setState(() {
      _image = base64Image;
    });
  }

   getImage(){
    if(userProfileController.user.photo==""){
      return const AssetImage('assets/blank_user_image.png');
    }else{
      return MemoryImage(base64Decode(userProfileController.user.photo));
    }
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
    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        scrolledUnderElevation: 0.0,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: width * 0.05, // 5% of screen width
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(width * 0.05), // 5% of screen width
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
                            width: width * 0.45, // 45% of screen width
                            height: height * 0.25, // 25% of screen height
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
                                image:MemoryImage(base64Decode(_image!)),
                              ),
                            ),
                          )
                        : Container(
                            width: width * 0.45, // 45% of screen width
                            height: height * 0.25, // 25% of screen height
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
                                  image:getImage()
                              ),
                            ),
                          ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: selectImage,
                        child: Container(
                          height: height * 0.05, // 5% of screen height
                          width: width * 0.1, // 10% of screen width
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
                            size: width * 0.05, // 5% of screen width
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05, // 5% of screen height
              ),
              InputTextField(
                controller: firstNameController,
                labelText: 'First Name',
                hintText: userProfileController.user.firstName,
                obscuredProperty: false,
              ),
              SizedBox(
                height: height * 0.05, // 5% of screen height
              ),
              InputTextField(
                controller: lastNameController,
                labelText: 'Last Name',
                hintText: userProfileController.user.lastName,
                obscuredProperty: false,
              ),
              SizedBox(
                height: height * 0.05, // 5% of screen height
              ),
              InputTextField(
                controller: emailController,
                labelText: 'Email',
                hintText: userProfileController.user.email,
                obscuredProperty: false,
              ),
              SizedBox(
                height: height * 0.05, // 5% of screen height
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomButton(kBackgroundColor, 'CANCEL', Colors.black, context),
                  bottomButton(kPrimaryColor, ' SAVE ', kBackgroundColor, context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  OutlinedButton bottomButton(
      Color backgroundColor, String text, Color textColor, BuildContext context) {
    ScreenDimensions.init(context);
    double width = ScreenDimensions.screenWidth;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: width * 0.1), // 10% of screen width
          elevation: 5),
      onPressed: () {
        if (text == 'CANCEL') {
          Navigator.pop(context);
        } else {
          userProfileController.updateUser(firstNameController.text,
              lastNameController.text, emailController.text,_image);
          Navigator.pop(context);
        }
      },
      child: Text(
        text,
        style: TextStyle(fontSize: width * 0.04, letterSpacing: 2, color: textColor), // 4% of screen width
      ),
    );
  }
}