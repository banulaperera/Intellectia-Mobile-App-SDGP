import 'package:client/models/notification_model.dart';
import 'package:client/repository/notification_repository.dart';
import 'package:client/util/cron_job_util.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializeNotification() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _showNotification(String title, String body) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      "channel1",
      "notification channel",
      importance: Importance.max,
      priority: Priority.max,
      // styleInformation:BigPictureStyleInformation(
      //     FilePathAndroidBitmap("assets/undraw_taking_notes_re_bnaf (1) 1.png")
      // )
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }

  showRankNotification(int newLevel) async {
    String title = 'Congratulations..';
    String body =
        'You have reached level ${newLevel}. Keep pushing your limits';
    var notificationM = NotificationM(
        title: title, body: body, type: "rank", date: DateTime.now());

    await NotificationRepository().addNotification(notificationM);
    _showNotification(title, body);
  }

  showYoutubeNotification() async {
    List<String>? video=await NotificationRepository().getYoutubeNotificationLink();
    if(video != null){
      String title= 'Suggestions';
      String body ='New suggestion.check out this video on ${video[1]}';
      var notificationM=NotificationM(
          title: title,
          body: body,
          type: "youtube",
          date:DateTime.now(),
          link:  video[0]);

      await NotificationRepository().addNotification(notificationM);
      _showNotification(title,body);
    }
   }
}
