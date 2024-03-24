import 'package:client/controllers/quiz_preference_setting_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/setting_screen/quiz_preference_setting.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('GoalSetting Widget Test', (WidgetTester tester) async {
    Get.put(GoalSettingController());
    // Get.put(NoteController());
    // Build the GoalSetting widget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: GoalSetting(),
      ),
    );

    // Verify if the GoalSetting widget is rendered
    expect(find.byType(GoalSetting), findsOneWidget);

    // Verify if the "Quiz Preference" title is found
    expect(find.text('Quiz Preference'), findsOneWidget);

    // Verify if the "CANCEL" and "SAVE" buttons are found
    expect(find.text('CANCEL'), findsOneWidget);
    expect(find.text(' SAVE '), findsOneWidget);
  });
}