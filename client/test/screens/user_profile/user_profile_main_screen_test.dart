import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/user_profile/user_profile_main_screen.dart';
import 'package:client/controllers/user_profile_controller.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('UserProfile shows the correct initial widgets',
      (WidgetTester tester) async {
    // Initialize the UserProfileController
    Get.put(UserProfileController());

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: UserProfile()));

    // Verify that the correct widgets are shown initially.
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('My Profile'), findsOneWidget);
    expect(find.byType(RefreshIndicator), findsOneWidget);
  });
}
