import 'package:flutter/Material.dart';

class QuizSuggestNotification extends StatefulWidget {
  const QuizSuggestNotification({super.key});

  @override
  State<QuizSuggestNotification> createState() =>
      _QuizSuggestNotificationState();
}

class _QuizSuggestNotificationState extends State<QuizSuggestNotification> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage('assets/target.png'), fit: BoxFit.cover),
        ),
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quiz!!!',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text(
            '2h Ago',
            style: TextStyle(fontSize: 12,color: Colors.black45, fontStyle: FontStyle.italic),
          ),
        ],
      ),
      subtitle: const Text(
        'You have already missed a quiz today. click to take the quiz!',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {},
      enabled: true,
    );
  }
}
