import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/quiz/score/score_screen.dart';
import 'package:get/get.dart';
import 'package:client/controllers/question_controller.dart';

void main() {
  testWidgets('ScoreScreen Widget Test', (WidgetTester tester) async {
    // Initialize the QuestionController for the test
    Get.put(QuestionController());

    // Build the ScoreScreen widget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: ScoreScreen(),
      ),
    );

    // Verify if the ScoreScreen widget is rendered
    expect(find.byType(ScoreScreen), findsOneWidget);

    // Verify if the Text widget with "Your Score: " is found
    expect(find.text('Your Score: '), findsOneWidget);
  });
}