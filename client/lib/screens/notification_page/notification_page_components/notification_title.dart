import 'package:client/models/notification_model.dart';
import 'package:flutter/Material.dart';

class NotificationTitle extends StatelessWidget {
  final NotificationM notifications;

  const NotificationTitle(this.notifications, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage(''), fit: BoxFit.cover),
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
            notifications.date.toString(),
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
      onTap: () {},
      enabled: true,
    );
  }
}
