import 'dart:convert';

import 'package:client/models/questions.dart';
import 'package:client/models/scheduleQuizDetails.dart';
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

  Future<bool> addScheduleQuizDetails(ScheduleQuizDetail scheduleQuizDetail) async {
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

  Future<List<ScheduleQuizDetail>?> getAllScheduleQuizDetails() async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();
    final res = await http.get(Uri.parse('$baseUrl/quiz/schedule/getAll-details'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "bearer $accessToken"
        });

    if (res.statusCode == 200) {
      final resData = jsonDecode(res.body);
      List<ScheduleQuizDetail> scheduleDetails = [
        ...resData['scheduleDetails'].map((scheduleQuiz) => ScheduleQuizDetail.fromJson(scheduleQuiz))
      ];
      if (scheduleDetails.isNotEmpty) return scheduleDetails;
    }
    return null;
  }

  Future<bool> updateScheduleQuizDetails(ScheduleQuizDetail scheduleQuizDetail) async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();

    final res = await http.put(Uri.parse('$baseUrl/quiz/schedule/update-details'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "bearer $accessToken"
        },
        body: jsonEncode(scheduleQuizDetail.toJsonWithID()));

    Map<String, dynamic> resData = jsonDecode(res.body);

    if (res.statusCode == 200) {
      showSuccess(resData['Message']);
      return true;
    } else {
      showError(resData['Message']);
      return false;
    }
  }

  Future<bool> deleteScheduleQuizDetails(String scheduleQuizDetailID) async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();

    final res = await http.delete(
      Uri.parse('$baseUrl/quiz/schedule/delete-details/$scheduleQuizDetailID'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        "Authorization": "bearer $accessToken"
      },
    );
    Map<String, dynamic> resData = jsonDecode(res.body);
    if (res.statusCode == 200) {
      showSuccess(resData['Message']);
      return true;
    } else {
      showError(resData['Message']);
      return false;
    }
  }

}
