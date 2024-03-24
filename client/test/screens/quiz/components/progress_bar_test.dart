import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/quiz/components/progress_bar.dart';
import 'package:get/get.dart';
import 'package:client/controllers/question_controller.dart';

void main() {
  testWidgets('ProgressBar Widget Test', (WidgetTester tester) async {
    // Initialize the QuestionController for the test
    Get.put(QuestionController());

    // Build the ProgressBar widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: MaterialApp(
          home: Scaffold(
            body: ProgressBar(
              key: UniqueKey(),
            ),
          ),
        ),
      ),
    );

    // Verify if the ProgressBar widget is rendered
    expect(find.byType(ProgressBar), findsOneWidget);

    // Verify if the Icon widget with stopwatch icon is found
    expect(find.byIcon(BootstrapIcons.stopwatch), findsOneWidget);
  });
}