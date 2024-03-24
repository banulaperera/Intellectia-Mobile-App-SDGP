import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/quiz/components/body.dart';
import 'package:get/get.dart';
import 'package:client/controllers/question_controller.dart';

void main() {
  testWidgets('Body Widget Test', (WidgetTester tester) async {
    // Initialize the QuestionController for the test
    Get.put(QuestionController());

    // Build the Body widget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: Body({}),
      ),
    );

    // Verify if the Body widget is rendered
    expect(find.byType(Body), findsOneWidget);
  });
}