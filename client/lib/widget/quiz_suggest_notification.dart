import 'package:flutter/Material.dart';

class QuizSuggestNotification extends StatefulWidget {
  const QuizSuggestNotification({super.key});

  @override
  State<QuizSuggestNotification> createState() =>
      _QuizSuggestNotificationState();
}

class _QuizSuggestNotificationState
    extends State<QuizSuggestNotification> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 25,
            backgroundImage: AssetImage('assets/target 1.png'),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              'You have already missed a quiz today. click to take the quiz!',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              maxLines: null, // Add this line to ensure text doesn't wrap
            ),
          )
        ],
      ),
    );
  }
}