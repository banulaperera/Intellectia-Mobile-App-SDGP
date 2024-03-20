import 'dart:async';

import 'package:client/repository/notification_repository.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/notification_model.dart';

class NotificationController extends GetxController {

  List<NotificationM> _notifications = List.empty(growable: true);
  List<NotificationM> get notifications => _notifications;

  @override
  void onInit() {
    fetchNotifications();
    super.onInit();
  }

  Future<void> fetchNotifications() async {
    _notifications = await NotificationRepository().getAllNotification() ?? [];
    if(_notifications.isNotEmpty){

    }
    update();
    //fetch notifications from the server
  }

  Future<void> deleteNotification(String notificationID) async {
    await NotificationRepository().deleteNote(notificationID);
    // _notifications.removeWhere((element) => element.id == notificationID);
    // update();
    fetchNotifications();
  }

  Future<void> launchURL(String url) async {
    Uri uri;
    try {
      uri = Uri.parse(url);
    } catch (e) {
      throw 'Invalid URL: $url';
    }

    if (await launchUrl(uri, mode: LaunchMode.externalApplication));
    else {
      throw 'Could not launch $url';
    }
  }
}