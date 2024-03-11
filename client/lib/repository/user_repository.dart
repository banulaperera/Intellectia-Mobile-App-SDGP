import 'dart:convert';

import 'package:client/models/user_model.dart';
import 'package:client/util/refresh_token.dart';
import 'package:http/http.dart' as http;
import 'package:client/util/local_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:client/util/show_alert.dart';
import 'package:client/util/db_util.dart';

class UserRepository {
  final localStorage = LocalStorage();

  Future<bool> signIn(String email, String password) async {
    final res = await http.post(Uri.parse('$baseUrl/user/login'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}));

    final Map<String, dynamic> data = jsonDecode(res.body);

    if (res.statusCode == 200) {
      final userID = JwtDecoder.decode(data["accessToken"])["userID"];
      localStorage.setUserID(userID);
      localStorage.setAccessToken(data["accessToken"]);
      localStorage.setRefreshToken(data["refreshToken"]);
      showSuccess(data["Message"]);
      return true;
    } else {
      showError(data["Message"]);
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    final res = await http.post(Uri.parse("$baseUrl/user/register"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}));
    final Map<String, dynamic> data = jsonDecode(res.body);
    if (res.statusCode == 200) {
      showSuccess(data["Message"]);
      return true;
    } else {
      showError(data["Message"]);
      return false;
    }
  }

  Future<User?> getUserDetails() async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();
    final res = await http.get(
      Uri.parse("$baseUrl/user/details"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        "Authorization": "bearer $accessToken"
      },
    );

    final Map<String, dynamic> data = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return User.fromJson(data);
    }
    return null;
  }

  Future<void> updateUserDetails(User user) async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();
    final res = await http.post(
      Uri.parse("$baseUrl/user/update"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        "Authorization": "bearer $accessToken"
      },
      body: jsonEncode(user.toJson())
    );
    final Map<String, dynamic> data = jsonDecode(res.body);
    if (res.statusCode!=200) {
      showError(data["Message"]);
    }
  }

  Future<void> changeUserPassword(String currentPassword, String newPassword) async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();
    final res = await http.post(
        Uri.parse("$baseUrl/user/change-password"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "bearer $accessToken"
        },
        body:jsonEncode({"currentPassword":currentPassword,"newPassword":newPassword})
    );
    final Map<String, dynamic> data = jsonDecode(res.body);
    if (res.statusCode==200) {
      showSuccess(data["Message"]);
    }else{
      showError(data["Message"]);
    }
  }









}
