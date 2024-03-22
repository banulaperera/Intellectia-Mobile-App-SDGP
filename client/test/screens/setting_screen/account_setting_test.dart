import 'package:client/controllers/user_profile_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/setting_screen/account_setting.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('AccountSetting Widget Test', (WidgetTester tester) async {
    Get.put(UserProfileController());
    // Build the AccountSetting widget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: AccountSetting(),
      ),
    );

    // Verify if the AccountSetting widget is rendered
    expect(find.byType(AccountSetting), findsOneWidget);

    // Verify if the "Edit Profile" title is found
    expect(find.text('Edit Profile'), findsOneWidget);

    // Verify if the "CANCEL" and "SAVE" buttons are found
    expect(find.text('CANCEL'), findsOneWidget);
    expect(find.text(' SAVE '), findsOneWidget);
  });
}