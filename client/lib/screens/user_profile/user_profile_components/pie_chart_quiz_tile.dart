import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class QuizTile extends StatelessWidget {
  final String url;
  final String name;
  final int quizzes;

  const QuizTile({
    required this.url,
    required this.name,
    required this.quizzes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black.withOpacity(0.15),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: Lottie.asset(url),
            ),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              quizzes.toString(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
