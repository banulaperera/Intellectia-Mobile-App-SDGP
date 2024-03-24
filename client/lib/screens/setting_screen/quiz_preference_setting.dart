import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:client/controllers/quiz_preference_setting_controller.dart';
import 'package:client/util/show_Alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class GoalSetting extends StatefulWidget {
  const GoalSetting({super.key});

  @override
  State<GoalSetting> createState() => _GoalSettingState();
}

class _GoalSettingState extends State<GoalSetting> {
  String? _selectedTime;

  @override
  Widget build(BuildContext context) {
    final GoalSettingController goalSettingController =
        Get.put(GoalSettingController());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Quiz Preference',
          style: TextStyle(
            fontSize: appBarTitleSize,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Tailor Your Learning Experience Customize Your Quiz Preferences',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 10),
              Lottie.asset(
                'animations/Animation - 1710747144874.json',
                height: 250,
                reverse: true,
                repeat: true,
                animate: true,
              ),
              const SizedBox(height: 30),
              _buildDropdown(
                label: 'Select Module',
                value: goalSettingController.moduleSelectedValue,
                items: goalSettingController.moduleNames
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    goalSettingController.moduleSelectedValue = newValue!;
                  });
                },
              ),
              const SizedBox(height: 40),
              _buildDropdown(
                label: 'Select Frequency',
                value: goalSettingController.frequencySelectedValue,
                items: goalSettingController.frequencyDropdownItems,
                onChanged: (newValue) {
                  setState(() {
                    goalSettingController.frequencySelectedValue = newValue!;
                  });
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Preferred Time',
                    style: TextStyle(fontSize: 16, color: kPrimaryColor),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: kBackgroundColor,
                      fixedSize: const Size(200, 45),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(color: Colors.black, width: 0.5),
                      elevation: 5,
                    ),
                    onPressed: _showTimePicker,
                    icon: const Icon(BootstrapIcons.clock, size: 20),
                    label: Text(
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        _selectedTime != null ? _selectedTime! : 'Select Time'),
                    // style: ElevatedButton.styleFrom(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 40, vertical: 10),
                    // ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
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

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<DropdownMenuItem<String>> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: kPrimaryColor),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: DropdownButton<String>(
            underline: const SizedBox(),
            dropdownColor: Colors.grey.shade200,
            value: value,
            items: items,
            onChanged: onChanged,
            isExpanded: true,
          ),
        ),
      ],
    );
  }

  Future<void> _showTimePicker() async {
    final TimeOfDay? result = await showTimePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
            data: Theme.of(context).copyWith(
                timePickerTheme: const TimePickerThemeData(
                  dayPeriodColor: Colors.blue,
                  dayPeriodBorderSide: BorderSide(color: Colors.blue),
                ),
                colorScheme: const ColorScheme.light(
                  primary: Colors.blue,
                )),
            child: MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
              child: child!,
            ));
      },
      barrierColor: Colors.grey.shade200,
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (result != null) {
      setState(() {
        _selectedTime =
            '${result.hour}:${result.minute.toString().padLeft(2, '0')}';
      });
    }
  }

  OutlinedButton bottomButton(
      Color backgroundColor, String text, Color textColor) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          elevation: 5),
      onPressed: () {
        if (text == 'CANCEL') {
          Get.back();
        } else {
          if (_selectedTime == null) {
            showError('Please select your preferred time');
          } else {
            final List<String> timeParts = _selectedTime!.split(':');
            final int hour = int.parse(timeParts[0]);
            final int minute = int.parse(timeParts[1].split(' ')[0]);

            // Get the current date
            final DateTime now = DateTime.now();
            final DateTime selectedDateTime =
                DateTime(now.year, now.month, now.day, hour, minute);
            var goalSettingController = Get.find<GoalSettingController>();
            if (goalSettingController.moduleSelectedValue.isEmpty) {
              showError('Please select a module');
              return;
            }
            goalSettingController.onModuleSelected(
                goalSettingController.moduleSelectedValue,
                goalSettingController.frequencySelectedValue,
                selectedDateTime);
            Navigator.pop(context);
          }
        }
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 14, letterSpacing: 2, color: textColor),
      ),
    );
  }
}
