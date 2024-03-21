import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/quiz/question_screen.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('QuizScreen Widget Test', (WidgetTester tester) async {
    // Build the QuizScreen widget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: QuizScreen(),
      ),
    );

    // Verify if the QuizScreen widget is rendered
    expect(find.byType(QuizScreen), findsOneWidget);

    // Verify if the Scaffold widget is found
    expect(find.byType(Scaffold), findsWidgets);
  });
}