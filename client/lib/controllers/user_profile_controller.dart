import 'package:client/models/bar_data_model.dart';
import 'package:client/models/user_model.dart';
import 'package:client/repository/user_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
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

  void changePassword(String currentPassword, String password) async {
    await UserRepository().changeUserPassword(currentPassword, password);
  }
}
