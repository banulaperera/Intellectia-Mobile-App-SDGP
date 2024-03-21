import 'package:client/screens/user_profile/user_profile_components/pie_chart_quiz_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

void main() {
  testWidgets('QuizTile Widget Test', (WidgetTester tester) async {
    // Define test data
    const String testUrl = 'test_assets/test_animation.json';
    const String testName = 'Test Name';
    const int testQuizzes = 10;

    // Build the QuizTile widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: QuizTile(
            url: testUrl,
            name: testName,
            quizzes: testQuizzes,
          ),
        ),
      ),
    );

    // Verify if the QuizTile widget is rendered
    expect(find.byType(Container), findsOneWidget);

    // Verify if Lottie animation is displayed
    expect(find.byType(Lottie), findsOneWidget);

    // Verify if the name and quizzes count are displayed correctly
    expect(find.text(testName), findsOneWidget);
    expect(find.text(testQuizzes.toString()), findsOneWidget);
  });
}
