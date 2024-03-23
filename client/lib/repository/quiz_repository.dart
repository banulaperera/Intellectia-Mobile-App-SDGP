import 'dart:convert';

import 'package:client/models/questions.dart';
import 'package:client/models/schedule_quiz_details.dart';
import 'package:client/util/db_util.dart';
import 'package:client/util/local_storage.dart';
import 'package:client/util/refresh_token.dart';
import 'package:client/util/show_alert.dart';
import 'package:http/http.dart' as http;

class QuizRepository {
  LocalStorage localStorage = LocalStorage();

  Future<List<Question>?> generateQuiz(String content) async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();

    final res = await http.post(Uri.parse('$baseUrl/quiz/generate'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "bearer $accessToken"
        },
        body: jsonEncode({'content': content}));

    Map<String, dynamic> resData = jsonDecode(res.body);
    if (res.statusCode == 200) {
      List<Question> questionList = [
        ...resData['questions'].map((question) => Question.fromJson(question))
      ];
      return questionList;
    } else {
      showError(resData['Message']);
      return null;
    }
  }

  Future<bool> addScheduleQuizDetails(
      ScheduleQuizDetail scheduleQuizDetail) async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();

    final res = await http.post(Uri.parse('$baseUrl/quiz/schedule/add-details'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "bearer $accessToken"
        },
        body: jsonEncode(scheduleQuizDetail.toJsonWithOutID()));

    Map<String, dynamic> resData = jsonDecode(res.body);

    if (res.statusCode == 200) {
      showSuccess(resData['Message']);
      return true;
    } else {
      showError(resData['Message']);
      return false;
    }
  }

  Future<ScheduleQuizDetail?> getScheduleQuizDetails() async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();
    final res = await http.get(
        Uri.parse('$baseUrl/quiz/schedule/get-details'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "bearer $accessToken"
        });

    if (res.statusCode == 200) {
      final Map<String, dynamic> resData = jsonDecode(res.body);
      return ScheduleQuizDetail.fromJson(resData);
    }
    return null;
  }
}
