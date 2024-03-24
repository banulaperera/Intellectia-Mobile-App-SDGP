import 'package:client/controllers/user_profile_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/setting_screen/main_setting_page.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('MainSettingPage Widget Test', (WidgetTester tester) async {
    Get.put(UserProfileController());
    // Build the MainSettingPage widget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: MainSettingPage(),
      ),
    );

    // Verify if the MainSettingPage widget is rendered
    expect(find.byType(MainSettingPage), findsOneWidget);

    // Verify if the "Settings" title is found
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
  });
}