import 'package:flutter/Material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/quiz/components/option.dart';
import 'package:get/get.dart';
import 'package:client/controllers/question_controller.dart';

void main() {
  testWidgets('Option Widget Test', (WidgetTester tester) async {
    // Initialize the QuestionController for the test
    Get.put(QuestionController());

    // Build the Option widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: MaterialApp(
          home: Scaffold(
            body: Option(
              key: UniqueKey(),
              text: 'Option 1',
              index: 0,
              press: () {},
            ),
          ),
        ),
      ),
    );

    // Verify if the Option widget is rendered
    expect(find.byType(Option), findsOneWidget);

    // Verify if the Text widget with "Option 1" is found
    expect(find.text('Option 1'), findsOneWidget);
  });
}