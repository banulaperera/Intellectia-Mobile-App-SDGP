import 'dart:convert';

import 'package:client/models/bar_data_model.dart';
import 'package:client/models/user_model.dart';
import 'package:client/repository/user_repository.dart';
import 'package:client/util/notification_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../util/show_Alert.dart';

class UserProfileController extends GetxController {
  final TextEditingController _existingPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  TextEditingController get existingPasswordController =>
      _existingPasswordController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  final RxBool _obscureText = true.obs;

  bool get obscureText => _obscureText.value;

  User user = User(
    photo: '',
    firstName: '',
    lastName: '',
    email: '',
    level: 0,
    correctedQuestions: 0,
    inCorrectedQuestions: 0,
    totalXP: 0,
    weeklyXP: [7],
  );

  BarData _barData = BarData(
    mondayExp: 0,
    tueExp: 0,
    wensExp: 0,
    thurExp: 0,
    friExp: 0,
    satExp: 0,
    sunExp: 0,
  );

  BarData get barData => _barData;

  double _redValue = 0;
  double _greenValue = 0;

  List<PieChartSectionData> _pieChartData = [];

  List<PieChartSectionData> get pieChartData => _pieChartData;

  int _xpDifference = 0;

  String _xpDifferenceText = '';

  String get xpDifferenceText => _xpDifferenceText;

  int _previousLevel = 0;

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  Future<void> fetchUser() async {
    user = (await UserRepository().getUserDetails())!;
    _barData = BarData(
      mondayExp: user.weeklyXP[0].toDouble(),
      tueExp: user.weeklyXP[1].toDouble(),
      wensExp: user.weeklyXP[2].toDouble(),
      thurExp: user.weeklyXP[3].toDouble(),
      friExp: user.weeklyXP[4].toDouble(),
      satExp: user.weeklyXP[5].toDouble(),
      sunExp: user.weeklyXP[6].toDouble(),
    );
    _barData.initializeBarData();

    if (user.correctedQuestions + user.inCorrectedQuestions == 0) {
      _redValue = 0;
      _greenValue = 0;
    } else {
      _redValue = (user.inCorrectedQuestions.toDouble() /
              (user.correctedQuestions + user.inCorrectedQuestions)) *
          100;
      _redValue = double.parse((_redValue).toStringAsFixed(1));
      _greenValue = (user.correctedQuestions.toDouble() /
              (user.correctedQuestions + user.inCorrectedQuestions)) *
          100;
      _greenValue = double.parse((_greenValue).toStringAsFixed(1));
    }

    _pieChartData = [
      PieChartSectionData(value: _redValue, color: Colors.red, radius: 40),
      PieChartSectionData(value: _greenValue, color: Colors.green, radius: 40),
    ];

    if (DateTime.now().weekday == 1) {
      _xpDifferenceText = 'You have gain 0 XP than yesterday';
      update();
      return;
    } else {
      _xpDifference = (user.weeklyXP[DateTime.now().weekday - 1]) -
          (user.weeklyXP[DateTime.now().weekday - 2]);
      if (_xpDifference < 0) {
        int positiveValue = _xpDifference.abs();
        _xpDifferenceText = 'You lost $positiveValue XP than yesterday';
      } else {
        _xpDifferenceText = 'You have gain $_xpDifference XP than yesterday';
      }
    }

    _previousLevel = user.level;
    update();
  }

  void updateUser(
      String? firstName, String? lastName, String? email, String? image) async {
    user
      ..firstName =
          (firstName?.isNotEmpty ?? false) ? firstName! : user.firstName
      ..lastName = (lastName?.isNotEmpty ?? false) ? lastName! : user.lastName
      ..email = (email?.isNotEmpty ?? false) ? email! : user.email
      ..photo = (image?.isNotEmpty ?? false) ? image! : user.photo;
    await UserRepository().updateUserDetails(user);
    update();
  }

  void isObscureText() {
    _obscureText.value = !_obscureText.value;
  }

  Future<void> changePassword(BuildContext context) async {
    if (_existingPasswordController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      showError('All fields are required');
    } else {
      if (_passwordController.text == _confirmPasswordController.text) {
        await UserRepository().changeUserPassword(
            _existingPasswordController.text, _passwordController.text);
        _existingPasswordController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
        if (Get.context != null && Get.context!.mounted) {
          Get.back();
        }
      } else {
        showError('Passwords do not match');
      }
    }
  }

  @override
  void onClose() {
    _existingPasswordController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.onClose();
  }

  void updateWeeklyXP(
      int numberOfCorrectQuestions, int numberOfInCorrectQuestions, int dayXp) {
    user.correctedQuestions += numberOfCorrectQuestions;
    user.inCorrectedQuestions += numberOfInCorrectQuestions;
    user.weeklyXP[DateTime.now().weekday - 1] += dayXp;
    user.totalXP += dayXp;
    user.level = (user.totalXP ~/ 10000) + 1;
    if (_previousLevel < user.level) {
      NotificationService().showRankNotification(user.level);
      _previousLevel = user.level;
    }
    UserRepository().updateUserDetails(user);
    update();
  }

  getImage() {
    if (user.photo.isEmpty) {
      return const AssetImage('assets/blank_user_image.png');
    } else {
      return MemoryImage(base64Decode(user.photo));
    }
  }
}
