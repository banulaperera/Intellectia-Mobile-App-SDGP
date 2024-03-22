import 'package:client/controllers/note_controller.dart';
import 'package:client/models/quiz_preference_model.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../models/note.dart';

class GoalSettingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchModuleNames();
  }

  //default values for quiz preference
  QuizPreferenceModel _quizPreferenceModel = QuizPreferenceModel(
    selectedModule: '',
    selectedFrequency: '',
    selectedTime: DateTime.now(),
  );

  QuizPreferenceModel get quizPreferenceModel => _quizPreferenceModel;

  String moduleSelectedValue = '';
  String frequencySelectedValue = "Once a day";

  List<String> _moduleNames = List.empty(growable: true);

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
    _moduleNames = uniqueModuleNames.toList();
    if (_moduleNames.isNotEmpty) {
      moduleSelectedValue = _moduleNames[0];
    }
    update();
  }

  void onModuleSelected(String selectedModule, String selectedFrequency,
      DateTime selectedTime) {
    _quizPreferenceModel = QuizPreferenceModel(
      selectedModule: selectedModule,
      selectedFrequency: selectedFrequency,
      selectedTime: selectedTime,
    );
    update();
  }
}
