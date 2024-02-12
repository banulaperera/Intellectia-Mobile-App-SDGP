import 'package:flutter/Material.dart';

class PerformanceSuggestionNotification extends StatefulWidget {
  const PerformanceSuggestionNotification({super.key});

  @override
  State<PerformanceSuggestionNotification> createState() =>
      _PerformanceSuggestionNotificationState();
}

class _PerformanceSuggestionNotificationState
    extends State<PerformanceSuggestionNotification> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            backgroundImage: AssetImage('assets/fire 2.png'),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              'You have ranked up and now you are a Master!',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              maxLines: null, // Add this line to ensure text doesn't wrap
            ),
          )
        ],
      ),
    );
  }
}
