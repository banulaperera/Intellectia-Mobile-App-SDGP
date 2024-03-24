import 'package:flutter/Material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/quiz/components/question_card.dart';
import 'package:get/get.dart';
import 'package:client/controllers/question_controller.dart';
import 'package:client/models/questions.dart';

void main() {
  testWidgets('QuestionCard Widget Test', (WidgetTester tester) async {
    // Initialize the QuestionController for the test
    Get.put(QuestionController());

    // Create a sample question
    Question sampleQuestion = Question(
      question: "Sample Question",
      options: ["Option 1", "Option 2", "Option 3", "Option 4"],
      answer: "Option 1",
    );

    // Build the QuestionCard widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: MaterialApp(
          home: Scaffold(
            body: QuestionCard(
              key: UniqueKey(),
              question: sampleQuestion,
            ),
          ),
        ),
      ),
    );

    // Verify if the QuestionCard widget is rendered
    expect(find.byType(QuestionCard), findsOneWidget);

    // Verify if the Text widget with "Sample Question" is found
    expect(find.text('Sample Question'), findsOneWidget);
  });
}