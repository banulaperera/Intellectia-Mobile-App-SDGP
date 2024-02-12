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
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 25,
            backgroundImage: AssetImage('assets/youtube 1.png'),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              'New suggestion. Check out this video on Database Management.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              maxLines: null, // Add this line to ensure text doesn't wrap
            ),
          )
        ],
      ),
    );
  }
}
