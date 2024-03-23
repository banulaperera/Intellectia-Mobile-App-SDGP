import 'package:client/models/notification_model.dart';
import 'package:client/repository/notification_repository.dart';
import 'package:client/util/local_storage.dart';
import 'package:client/util/refresh_token.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  LocalStorage localStorage=LocalStorage();

  Future<void> initializeNotification() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
    await getPermissionForNotification();
  }

  Future<void> _showNotification(String title, String body,
      AndroidNotificationDetails androidNotificationDetails) async {
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }

  showRankNotification(int newLevel) async {
    if(await localStorage.getRankNotificationStatus()){
      String title = 'Congratulations..';
      String body = 'You have reached level $newLevel. Keep pushing your limits';
      var notificationM = NotificationM(
          title: title, body: body, type: "rank", date: DateTime.now());

      await NotificationRepository().addNotification(notificationM);

      const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
        "channel-1",
        "rank notification",
        importance: Importance.max,
        priority: Priority.max,
        largeIcon: DrawableResourceAndroidBitmap('@mipmap/thunder'),
      );

      _showNotification(title, body, androidNotificationDetails);
    }

  }

  showYoutubeNotification() async {
    if(await localStorage.getYoutubeNotificationStatus()){
      final bool tokenExpired=await checkRefreshTokenIsExpired();
      if(!tokenExpired){
        List<String>? video =
        await NotificationRepository().getYoutubeNotificationLink();
        if (video != null) {
          String title = 'Suggestions';
          String body = 'New suggestion. check out this video on ${video[1]}';
          var notificationM = NotificationM(
              title: title,
              body: body,
              type: "youtube",
              date: DateTime.now(),
              link: video[0]);

          await NotificationRepository().addNotification(notificationM);

          const AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
            "channel-2",
            "youtube notification",
            importance: Importance.max,
            priority: Priority.max,
            largeIcon: DrawableResourceAndroidBitmap('@mipmap/thunder'),
          );
          _showNotification(title, body, androidNotificationDetails);
        }
      }
    }

  }

  getPermissionForNotification() async {
    var isDenied = await Permission.notification.isDenied;
    if (isDenied) {
      Permission.notification.request();
    }
  }
}
