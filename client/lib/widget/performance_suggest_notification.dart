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
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage('assets/fire 2.png'),
            fit: BoxFit.cover
          ),
        ),
      ),
      title: const Text('Performance', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      subtitle: const Text('You have ranked up and now you are a Master!', style: TextStyle(color: Colors.black45, fontStyle: FontStyle.italic),),
      onTap: (){},
      enabled: true,
    );
  }
}
