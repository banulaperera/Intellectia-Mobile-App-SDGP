import 'package:client/models/notification_model.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/notification_controller.dart';
import '../../../util/screen_dimension.dart';

class NotificationTitle extends StatelessWidget {
  final NotificationM notifications;

  NotificationTitle(this.notifications, {super.key});

  final notificationController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

    return ListTile(
      leading: Container(
        height: height * 0.05, // 5% of screen height
        width: width * 0.1, // 10% of screen width
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
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: width * 0.04), // 4% of screen width
          ),
          Text(
            DateFormat('yyyy-MM-dd HH:mm a').format(notifications.date.toUtc()),
            style: TextStyle(
                fontSize: width * 0.025, // 3% of screen width
                color: Colors.black45,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
      subtitle: Text(
        notifications.body,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: width * 0.035, // 3.5% of screen width
        ),
      ),
      onTap: () {
        if (notifications.link != null) {
          notificationController.launchURL(notifications.link!);
        }
      },
      enabled: true,
    );
  }
}