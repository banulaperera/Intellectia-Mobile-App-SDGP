import 'package:client/controllers/user_profile_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/setting_screen/change_password.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('ChangePassword Widget Test', (WidgetTester tester) async {
    Get.put(UserProfileController());
    // Build the ChangePassword widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: ChangePassword(),
      ),
    );

    // Verify if the ChangePassword widget is rendered
    expect(find.byType(ChangePassword), findsOneWidget);

    // Verify if the "Create new password" title is found
    expect(find.text('Create new password'), findsOneWidget);
    expect(find.text('Your new password must be different from previous used passwords.'), findsOneWidget);
    expect(find.text('Existing Password'), findsOneWidget);
  });
}