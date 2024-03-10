import 'dart:convert';

import 'package:client/models/questions.dart';
import 'package:client/util/db_util.dart';
import 'package:client/util/local_storage.dart';
import 'package:client/util/refresh_token.dart';
import 'package:client/util/show_Alert.dart';
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
}
