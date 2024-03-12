import '../models/notification_model.dart';

class NotificationController {
  static List<NotificationM> listOfNotifications() {
    return [
      NotificationM(
          title: 'New Notification',
          body: 'This is a new notification',
          type: 'new',
      date: DateTime.now()),

      NotificationM(
          title: 'New Notification',
          body: 'This is a new notification',
          type: 'new',
          date: DateTime.now()),
    ];
  }
}