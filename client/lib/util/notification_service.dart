import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationService {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
    
    Future<void> initializeNotification() async{
      const AndroidInitializationSettings androidInitializationSettings=AndroidInitializationSettings('@mipmap/ic_launcher');
      const InitializationSettings initializationSettings=InitializationSettings(android: androidInitializationSettings);
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    }

    Future<void> showNotification(String title,String body) async{
      const AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails("channel1","notification channel",importance: Importance.max,priority: Priority.max);
      const NotificationDetails notificationDetails=NotificationDetails(android: androidNotificationDetails);

      await flutterLocalNotificationsPlugin.show(0,title,body,notificationDetails);
    }




}


