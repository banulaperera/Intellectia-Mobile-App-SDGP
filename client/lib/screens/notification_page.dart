import 'package:client/widget/performance_suggest_notification.dart';
import 'package:client/widget/quiz_suggest_notification.dart';
import 'package:client/widget/youtube_suggest_notification_widget.dart';
import 'package:flutter/Material.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List newMsg = [const PerformanceSuggestionNotification(), const YouTubeSuggestNotification(), const QuizSuggestNotification()];
  final List today = [const YouTubeSuggestNotification(), const QuizSuggestNotification(),const PerformanceSuggestionNotification(), const YouTubeSuggestNotification(), const QuizSuggestNotification()];
  final List older = [const YouTubeSuggestNotification(), const YouTubeSuggestNotification(), const QuizSuggestNotification()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return newMsg[index];
                  },
                  itemCount: newMsg.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Tomorrow',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return today[index];
                  },
                  itemCount: today.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Older',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return older[index];
                  },
                  itemCount: older.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
                // PerformanceSuggestionNotification(),
                // YouTubeSuggestNotification(),
                // QuizSuggestNotification()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
