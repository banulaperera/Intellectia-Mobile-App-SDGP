import 'package:client/constants.dart';
import 'package:client/controllers/notification_controller.dart';
import 'package:client/screens/notification_page/notification_page_components/show_notification.dart';
import 'package:client/util/connection_lost.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController notificationController =
        Get.put(NotificationController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Notification',
            style: TextStyle(
                fontSize: appBarTitleSize,
                fontWeight: FontWeight.w500,
                letterSpacing: 2),
          ),
          scrolledUnderElevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
            future: notificationController.fetchNotifications(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ), // Loading animation
                );
              } else if (snapshot.hasError) {
                return Center(child: connectionLost());
              } else {
                return Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: SingleChildScrollView(
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShowNotification(
                              list: notificationController.notifications),
                        ],
                      );
                    }),
                  ),
                );
              }
            }),
      ),
    );
  }

  Text showText(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    );
  }
}
