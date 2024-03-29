import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../util/screen_dimension.dart';

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
    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

    return Container(
      padding: EdgeInsets.all(width * 0.025), // 2.5% of screen width
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
        padding: EdgeInsets.symmetric(horizontal: width * 0.05), // 5% of screen width
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: height * 0.05, // 5% of screen height
              width: width * 0.1, // 10% of screen width
              child: Lottie.asset(url),
            ),
            Flexible(
              child: Text(
                name,
                style: TextStyle(fontSize: width * 0.025, fontWeight: FontWeight.w600), // 3.5% of screen width
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Text(
                quizzes.toString(),
                style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.w600), // 4% of screen width
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}