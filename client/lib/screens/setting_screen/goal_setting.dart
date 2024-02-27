import 'package:client/constants.dart';
import 'package:flutter/Material.dart';

class GoalSetting extends StatefulWidget {
  const GoalSetting({super.key});

  @override
  State<GoalSetting> createState() => _GoalSettingState();
}

class _GoalSettingState extends State<GoalSetting> {
  List<DropdownMenuItem<String>> get moduleDropdownItems {
    List<DropdownMenuItem<String>> moduleMenuItems = [
      const DropdownMenuItem(value: "Module 1", child: Text("Module 1")),
      const DropdownMenuItem(value: "Module 2", child: Text("Module 2")),
      const DropdownMenuItem(value: "Module 3", child: Text("Module 3")),
      const DropdownMenuItem(value: "Module 4", child: Text("Module 4")),
    ];
    return moduleMenuItems;
  }

  List<DropdownMenuItem<String>> get frequencyDropdownItems {
    List<DropdownMenuItem<String>> frequencyMenuItems = [
      const DropdownMenuItem(value: "Once a day", child: Text("Once a day")),
      const DropdownMenuItem(value: "Twice a day", child: Text("Twice a day")),
      const DropdownMenuItem(value: "Once a week", child: Text("Once a week")),
      const DropdownMenuItem(
          value: "Twice a week", child: Text("Twice a week")),
      const DropdownMenuItem(
          value: "Thrice a week", child: Text("Thrice a week")),
    ];
    return frequencyMenuItems;
  }

  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    String moduleSelectedValue = "Module 1";
    String frequencySelectedValue = "Twice a day";
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        scrolledUnderElevation: 0.0,
        title: const Text(
          'Goal Setting',
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
                child: Text('Enter Quiz Preferences'),
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Select Module'),
                  DropdownButton(
                    value: moduleSelectedValue,
                    items: moduleDropdownItems,
                    onChanged: (String? newValue) {
                      setState(() {
                        moduleSelectedValue = newValue!;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Select Frequency'),
                  DropdownButton(
                    value: frequencySelectedValue,
                    items: frequencyDropdownItems,
                    onChanged: (String? newValue) {
                      setState(() {
                        frequencySelectedValue = newValue!;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Preferred Time 1'),
                  TextButton(
                      onPressed: () => _selectTime(context),
                      child: const Text('Select Time'))
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Preferred Time 2'),
                  TextButton(
                      onPressed: () => _selectTime(context),
                      child: const Text('Select Time'))
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Preferred Time 3'),
                  TextButton(
                      onPressed: () => _selectTime(context),
                      child: const Text('Select Time'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedS = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });
    if (pickedS != null && pickedS != selectedTime) {
      setState(() {
        selectedTime = pickedS;
      });
    }
  }
}
