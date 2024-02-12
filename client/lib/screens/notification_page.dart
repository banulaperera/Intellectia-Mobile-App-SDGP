import 'package:client/widget/performance_suggest_notification.dart';
import 'package:client/widget/quiz_suggest_notification.dart';
import 'package:client/widget/youtube_suggest_notification_widget.dart';
import 'package:flutter/Material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New',
                style: Theme.of(context).textTheme.headline4,
              ),
              const PerformanceSuggestionNotification(),
              const YouTubeSuggestNotification(),
              const QuizSuggestNotification()
            ],
          ),
        ),
      ),
    );
  }
}
