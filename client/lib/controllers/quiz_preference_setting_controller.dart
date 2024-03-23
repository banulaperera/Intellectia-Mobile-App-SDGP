import 'package:client/controllers/note_controller.dart';
import 'package:client/repository/quiz_repository.dart';
import 'package:client/util/cron_job_util.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../models/note.dart';
import '../models/schedule_quiz_details.dart';

class GoalSettingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchModuleNames();
  }

  String moduleSelectedValue = '';
  String frequencySelectedValue = "Once a day";

  final RxList<String> _moduleNames = <String>[].obs;

  List<String> get moduleNames => _moduleNames;

  List<DropdownMenuItem<String>> get frequencyDropdownItems {
    List<DropdownMenuItem<String>> frequencyMenuItems = [
      const DropdownMenuItem(value: "Once a day", child: Text("Once a day")),
      const DropdownMenuItem(value: "Once a week", child: Text("Once a week")),
      const DropdownMenuItem(
          value: "Twice a week", child: Text("Twice a week")),
      const DropdownMenuItem(
          value: "Thrice a week", child: Text("Thrice a week")),
    ];
    return frequencyMenuItems;
  }

  Future<void> fetchModuleNames() async {
    var noteController = Get.put(NoteController());
    List<Note> getNote = noteController.allNotes;
    Set<String> uniqueModuleNames = <String>{};
    for (final note in getNote) {
      uniqueModuleNames.add(note.moduleName);
    }
    _moduleNames.assignAll(uniqueModuleNames);
    if (_moduleNames.isNotEmpty) {
      moduleSelectedValue = _moduleNames[0];
    }
  }

  void onModuleSelected(String selectedModule, String selectedFrequency,
      DateTime selectedTime) async {
      CronJobService cronJobService=CronJobService();
    await QuizRepository().addScheduleQuizDetails(ScheduleQuizDetail(
        preferredModuleName: selectedModule,
        preferredTime: selectedTime,
        preferredFrequency: selectedFrequency));

      if(selectedFrequency=="Once a day"){
        cronJobService.addQuizSchedule("${selectedTime.minute} ${selectedTime.hour} * * *",selectedModule);
      }else if(selectedFrequency=="Once a week"){
        cronJobService.addQuizSchedule("${selectedTime.minute} ${selectedTime.hour} * * 3",selectedModule);
      }else if(selectedFrequency=="Twice a week"){
        cronJobService.addQuizSchedule("${selectedTime.minute} ${selectedTime.hour} * * 1,5",selectedModule);
      }else if(selectedFrequency=="Thrice a week"){
        cronJobService.addQuizSchedule("${selectedTime.minute} ${selectedTime.hour} * * 1,3,6",selectedModule);
      }
  }
}
