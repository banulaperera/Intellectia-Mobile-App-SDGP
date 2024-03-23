import 'dart:convert';

import 'package:http/http.dart' as http;

class MlModelRepository {
  Future<List<String>?> getPredictedModuleNames(String content) async {
    final res =
        await http.post(Uri.parse('http://13.49.175.142:5000/api/predict'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode({"text": content}));

    if (res.headers['content-type'] != 'application/json') {
      return null;
    }

    try {
      Map<String, dynamic> resData = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return List<String>.from(resData["prediction"]);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
