import 'package:client/models/notification_model.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/notification_controller.dart';

class NotificationTitle extends StatelessWidget {
  final NotificationM notifications;

  NotificationTitle(this.notifications, {super.key});

  final notificationController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage(notifications.imageResource),
              fit: BoxFit.cover),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            notifications.title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text(
            DateFormat('yyyy-MM-dd HH:mm').format(notifications.date),
            style: const TextStyle(
                fontSize: 12,
                color: Colors.black45,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
      subtitle: Text(
        notifications.body,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        notificationController.launchURL(notifications.link!);
      },
      enabled: true,
    );
  }
}
