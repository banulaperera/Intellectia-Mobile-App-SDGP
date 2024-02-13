import 'package:client/models/notification_model.dart';
import 'package:flutter/Material.dart';

class NotificationTitle extends StatelessWidget {
  final Notifications notifications;

  const NotificationTitle(this.notifications ,{super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage(notifications.path), fit: BoxFit.cover),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            notifications.titleName,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text(
            notifications.titleTime,
            style: const TextStyle(fontSize: 12,color: Colors.black45, fontStyle: FontStyle.italic),
          ),
        ],
      ),
      subtitle: Text(
        notifications.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {},
      enabled: true,
    );
  }
}
