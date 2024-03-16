import 'package:client/models/bar_data_model.dart';
import 'package:client/models/user_model.dart';
import 'package:client/repository/user_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../screens/setting_screen/main_setting_page.dart';
import '../util/show_Alert.dart';

class UserProfileController extends GetxController {
  final TextEditingController _existingPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  TextEditingController get existingPasswordController => _existingPasswordController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  final RxBool _obscureText = true.obs;
  bool get obscureText => _obscureText.value;

  User _user = User(
    photo: '',
    firstName: '',
    lastName: '',
    email: '',
    level: 0,
    correctedQuestions: 0,
    inCorrectedQuestions: 0,
    totalXP: 0,
    weeklyXP: [],
  );
  User get user => _user;

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

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  Future<void> fetchUser() async {

    _user = (await UserRepository().getUserDetails())!;

    _barData = BarData(
      mondayExp: _user.weeklyXP[0].toDouble(),
      tueExp: _user.weeklyXP[1].toDouble(),
      wensExp: _user.weeklyXP[2].toDouble(),
      thurExp: _user.weeklyXP[3].toDouble(),
      friExp: _user.weeklyXP[4].toDouble(),
      satExp: _user.weeklyXP[5].toDouble(),
      sunExp: _user.weeklyXP[6].toDouble(),
    );
    _barData.initializeBarData();

    if (_user.correctedQuestions + _user.inCorrectedQuestions == 0) {
      _redValue = 0;
      _greenValue = 0;
    } else {
      _redValue = (_user.inCorrectedQuestions.toDouble() /
              (_user.correctedQuestions + _user.inCorrectedQuestions)) *
          100;
      _redValue = double.parse((_redValue).toStringAsFixed(1));
      _greenValue = (_user.correctedQuestions.toDouble() /
              (_user.correctedQuestions + _user.inCorrectedQuestions)) *
          100;
      _greenValue = double.parse((_greenValue).toStringAsFixed(1));
    }

    _pieChartData = [
      PieChartSectionData(value: _redValue, color: Colors.red, radius: 40),
      PieChartSectionData(value: _greenValue, color: Colors.green, radius: 40),
    ];
    update();
  }

  void updateUser(String? firstName, String? lastName, String? email) async {
    _user
      ..firstName =
          (firstName?.isNotEmpty ?? false) ? firstName! : _user.firstName
      ..lastName = (lastName?.isNotEmpty ?? false) ? lastName! : _user.lastName
      ..email = (email?.isNotEmpty ?? false) ? email! : _user.email;
    await UserRepository().updateUserDetails(_user);
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
      if (_passwordController.text ==
          _confirmPasswordController.text) {
        await UserRepository().changeUserPassword(_existingPasswordController.text, _passwordController.text);
        _existingPasswordController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
        Get.off(() => const MainSettingPage());
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

  void updateWeeklyXP(int numberOfCorrectQuestions, int numberOfInCorrectQuestions) {
    _user.correctedQuestions += numberOfCorrectQuestions;
    _user.inCorrectedQuestions += numberOfInCorrectQuestions;
    // _user.weeklyXP[DateTime.now().weekday - 1] += dayXp;
    // _user.totalXP += dayXp;
    UserRepository().updateUserDetails(_user);
    update();
  }
}
