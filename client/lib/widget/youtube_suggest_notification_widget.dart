import 'package:flutter/Material.dart';

class YouTubeSuggestNotification extends StatefulWidget {
  const YouTubeSuggestNotification({super.key});

  @override
  State<YouTubeSuggestNotification> createState() =>
      _YouTubeSuggestNotificationState();
}

class _YouTubeSuggestNotificationState
    extends State<YouTubeSuggestNotification> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage('assets/youtube.png'), fit: BoxFit.cover),
        ),
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Suggestions',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text(
            '2h Ago',
            style: TextStyle(fontSize: 12,color: Colors.black45, fontStyle: FontStyle.italic),
          ),
        ],
      ),
      subtitle: const Text(
        'New suggestion. Check out this video on Database Management.',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(),
      ),
      // trailing: const Text(
      //   '12.00A.M',
      //   style: TextStyle(color: Colors.black26),
      // ),
      onTap: () {},
      enabled: true,
    );
  }
}
