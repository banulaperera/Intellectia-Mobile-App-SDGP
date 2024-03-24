import 'dart:async';

import 'package:client/repository/notification_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import '../models/notification_model.dart';

class NotificationController extends GetxController {
  final RxList<NotificationM> _notifications = <NotificationM>[].obs;

  List<NotificationM> get notifications => _notifications.toList();

  @override
  void onInit() {
    fetchNotifications();
    super.onInit();
  }

  Future<void> fetchNotifications() async {
    List<NotificationM> fetchedNotifications = await NotificationRepository().getAllNotification() ?? [];
    if (fetchedNotifications.isNotEmpty) {
      fetchedNotifications.sort((a, b) => b.date.compareTo(a.date));
    }
    _notifications.assignAll(fetchedNotifications);
  }

  Future<void> deleteNotification(String notificationID) async {
    await NotificationRepository().deleteNote(notificationID);
    _notifications.removeWhere((element) => element.id == notificationID);
    fetchNotifications();
  }

  Future<void> launchURL(String url) async {
    Uri uri;
    try {
      uri = Uri.parse(url);
    } catch (e) {
      throw 'Invalid URL: $url';
    }
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}