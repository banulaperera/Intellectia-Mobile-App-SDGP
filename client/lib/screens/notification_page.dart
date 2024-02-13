import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/widget/performance_suggest_notification.dart';
import 'package:client/widget/quiz_suggest_notification.dart';
import 'package:client/widget/youtube_suggest_notification_widget.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List newMsg = [
    const PerformanceSuggestionNotification(),
    const YouTubeSuggestNotification(),
    const QuizSuggestNotification()
  ];
  final List older = [
    const YouTubeSuggestNotification(),
    const YouTubeSuggestNotification(),
    const QuizSuggestNotification(),
    const YouTubeSuggestNotification(),
    const QuizSuggestNotification(),
    const PerformanceSuggestionNotification()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notification',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, letterSpacing: 2),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        extentRatio: .2,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            icon: BootstrapIcons.trash3_fill,
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                          )
                        ],
                      ),
                      child: newMsg[index],
                    );
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
                  'Last Week',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        extentRatio: .2,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            icon: BootstrapIcons.trash3_fill,
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                          )
                        ],
                      ),
                      child: older[index],
                    );
                  },
                  itemCount: older.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
