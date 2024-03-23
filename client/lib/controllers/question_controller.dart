import 'package:client/controllers/user_profile_controller.dart';
import 'package:client/models/questions.dart';
import 'package:client/repository/quiz_repository.dart';
import 'package:client/screens/quiz/score/score_screen.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../models/note.dart';
import '../repository/note_repository.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;

  late PageController _pageController;

  PageController get pageController => _pageController;

  List<Question> _questions =
      List.empty(growable: true); //need to update due to a error
  List<Question> get questions => _questions;

  bool _isAnswered = false;

  bool get isAnswered => _isAnswered;

  late int _correctAns;

  int get correctAns => _correctAns;

  late int _selectedAns;

  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;

  int get numOfCorrectAns => _numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    super.onInit();
    // animation duration is 60 s
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
  }

  // called just before the Controller is deleted from memory
  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    //need to add
    for (int i = 0; i < question.options.length; i++) {
      if (question.options[i] == question.answer) {
        _correctAns = i;
      }
    }
    // _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to navigate another page
      var userProfileController = Get.put(UserProfileController());
      userProfileController.updateWeeklyXP(
          _numOfCorrectAns, (5 - _numOfCorrectAns), _numOfCorrectAns * 2000);
      Get.off(() => const ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  List<Note> allNotes = [];
  ScheduleQuizDetail? scheduleQuizDetail = ;
  Future<void> fetchQuestions() async {
    allNotes = await NoteRepository().getAllNotes() ?? [];
    if (allNotes.isNotEmpty) {
      allNotes.sort((a, b) => b.createdDate.compareTo(a.createdDate));
      String latestCreatedDate = allNotes.first.content;
      _questions =
          (await QuizRepository().generateQuiz(latestCreatedDate))!.toList();
    }
    update();
  }
}
