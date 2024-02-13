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
     return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage('assets/target 1.png'),
              fit: BoxFit.cover
          ),
        ),
      ),
      title: const Text('Quiz!!!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      subtitle: const Text('You have already missed a quiz today. click to take the quiz!', style: TextStyle(color: Colors.black45, fontStyle: FontStyle.italic),),
      onTap: (){},
      enabled: true,
    );
  }
}