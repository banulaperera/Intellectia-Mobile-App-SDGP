import 'dart:convert';

import 'package:client/util/db_util.dart';
import 'package:client/util/local_storage.dart';
import 'package:client/util/show_alert.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<void> refreshToken() async {
    String refreshToken = await LocalStorage().getRefreshToken();
    final res = await http.post(Uri.parse('$baseUrl/auth/newToken'),
        headers: <String, String>{'Content-Type': 'Application/json'},
        body: jsonEncode({'refreshToken': refreshToken}));

    if (res.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(res.body);
      await LocalStorage().setAccessToken(data['accessToken']);
    } else {
      showError("Unable to generate Token ....!");
    }
  }
}
