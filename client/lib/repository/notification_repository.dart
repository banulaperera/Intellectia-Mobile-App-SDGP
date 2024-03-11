import 'dart:convert';

import 'package:client/models/notification_model.dart';
import 'package:client/util/db_util.dart';
import 'package:client/util/local_storage.dart';
import 'package:client/util/show_Alert.dart';
import 'package:http/http.dart' as http;
import 'package:client/util/refresh_token.dart';

class NotificationRepository{
  LocalStorage localStorage= LocalStorage();

  Future<List<Notification>?> getAllNotification() async{
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();
    final res=await http.get(Uri.parse('$baseUrl/notification/all'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      "Authorization": "bearer $accessToken"
    });

    if (res.statusCode == 200) {
      final resData = jsonDecode(res.body);
      List<Notification> notes = [
        ...resData['notifications'].map((notification) => Notification.fromJson(notification))
      ];
      if (notes.isNotEmpty) return notes;
    }
    return null;
  }

  Future<void> addNotification(Notification notification) async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();
    final res = await http.post(Uri.parse('$baseUrl/notification/add'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "bearer $accessToken"
        },
        body: jsonEncode(notification.toJson()));

    Map<String, dynamic> resData = jsonDecode(res.body);

    if (res.statusCode!=200) {
      showError(resData['Message']);
    }
  }

  Future<void> deleteNote(String notificationID) async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();

    final res = await http.delete(
      Uri.parse('$baseUrl/notification/delete/$notificationID'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        "Authorization": "bearer $accessToken"
      },
    );
    Map<String, dynamic> resData = jsonDecode(res.body);
    if (res.statusCode!=200) {
      showError(resData['Message']);
    }
  }

}