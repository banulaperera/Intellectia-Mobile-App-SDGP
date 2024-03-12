import 'package:client/constants.dart';
import 'package:client/controllers/notification_controller.dart';
import 'package:client/screens/notification_page/notification_page_components/show_notification.dart';
import 'package:flutter/Material.dart';
import '../../models/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationM> newList = [];
  List<NotificationM> oldList = [];

  @override
  void initState() {
    //need to modify the function to get the list of notifications
    newList = NotificationController.listOfNotifications();
    oldList = newList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                showText('New'),
                ShowNotification(list: newList),
                const SizedBox(
                  height: 20,
                ),
                showText('Old'),
                ShowNotification(list: oldList)
              ],
            ),
          ),
        ),
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
