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
              image: AssetImage('assets/youtube 1.png'),
              fit: BoxFit.cover
          ),
        ),
      ),
      title: const Text('Suggestions', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      subtitle: const Text('New suggestion. Check out this video on Database Management.', style: TextStyle(color: Colors.black45, fontStyle: FontStyle.italic),),
      onTap: (){},
      enabled: true,
    );
  }
}
