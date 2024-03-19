import 'package:client/util/cron_job_util.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationService {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
    
    Future<void> initializeNotification() async{
      const AndroidInitializationSettings androidInitializationSettings=AndroidInitializationSettings('@mipmap/ic_launcher');
      const InitializationSettings initializationSettings=InitializationSettings(android: androidInitializationSettings);
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
      CronJob().initializeJobs();
    }

    Future<void> showNotification(String title,String body) async{

      const AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails(
          "channel1",
          "notification channel",
          importance: Importance.max,
          priority: Priority.max,
          // styleInformation:BigPictureStyleInformation(
          //     FilePathAndroidBitmap("assets/undraw_taking_notes_re_bnaf (1) 1.png")
          // )

      );
      const NotificationDetails notificationDetails=NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNotificationsPlugin.show(0,title,body,notificationDetails);
    }




}


