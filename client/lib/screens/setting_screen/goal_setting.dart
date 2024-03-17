import 'package:client/constants.dart';
import 'package:client/screens/home_page/home_page.dart';
import 'package:client/screens/user_profile/user_profile_main_screen.dart';
import 'package:flutter/Material.dart';

class GoalSetting extends StatefulWidget {
  const GoalSetting({super.key});

  @override
  State<GoalSetting> createState() => _GoalSettingState();
}

class _GoalSettingState extends State<GoalSetting> {
  TextEditingController moduleController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();

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

  String frequencySelectedValue = "Twice a day";
  String moduleSelectedValue = "Module 1";

  String? _selectedTime;

  // TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
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
          left: 35,
          right: 35,
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
                  const Text('Preferred Time'),
                  TextButton(
                      onPressed: _show,
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.black),
                      child: const Text('Select Time'))
                ],
              ),
              Center(
                child: Text(
                  _selectedTime != null ? _selectedTime! : 'No time selected!',
                  style: const TextStyle(fontSize: 15),
                ),
              ),

              // Center(
              //     child: TextField(
              //   controller: timeInput,
              //   decoration: const InputDecoration(
              //       icon: Icon(Icons.timer), //icon of text field
              //       labelText: "Enter Time" //label text of field
              //       ),
              //   readOnly:
              //       true, //set it true, so that user will not able to edit text
              //   onTap: () async {
              //     TimeOfDay? pickedTime = await showTimePicker(
              //       initialTime: TimeOfDay.now(),
              //       context: context,
              //     );

              //     if (pickedTime != null) {
              //       print(pickedTime.format(context));
              //       //output 10:51 PM
              //       DateTime parsedTime = DateFormat.jm()
              //           .parse(pickedTime.format(context).toString());
              //       //converting to DateTime so that we can further format on different pattern.
              //       print(parsedTime);
              //       //output 1970-01-01 22:53:00.000
              //       String formattedTime =
              //           DateFormat('HH:mm:ss').format(parsedTime);
              //       print(formattedTime);
              //       //output 14:59:00
              //       //DateFormat() is from intl package, you can format the time on any pattern you need.

              //       setState(() {
              //         timeInput.text =
              //             formattedTime; //set the value of text field.
              //       });
              //     } else {
              //       print("Time is not selected");
              //     }
              //   },
              // )),

              // const SizedBox(
              //   height: 45,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Text('Preferred Time 2'),
              //     TextButton(
              //         onPressed: _show,
              //         style: TextButton.styleFrom(
              //             backgroundColor: Colors.grey,
              //             foregroundColor: Colors.black),
              //         child: const Text('Select Time'))
              //   ],
              // ),
              // Center(
              //   child: Text(
              //     _selectedTime != null ? _selectedTime! : 'No time selected!',
              //     style: const TextStyle(fontSize: 15),
              //   ),
              // ),
              // const SizedBox(
              //   height: 45,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Text('Preferred Time 3'),
              //     TextButton(
              //         onPressed: _show,
              //         style: TextButton.styleFrom(
              //             backgroundColor: Colors.grey,
              //             foregroundColor: Colors.black),
              //         child: const Text('Select Time'))
              //   ],
              // ),
              // Center(
              //   child: Text(
              //     _selectedTime != null ? _selectedTime! : 'No time selected!',
              //     style: const TextStyle(fontSize: 15),
              //   ),
              // ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => UserProfile()),
                        );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          foregroundColor: Colors.black),
                      child: const Text('Apply')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.black),
                      child: const Text('Cancel'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _show() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }
}
