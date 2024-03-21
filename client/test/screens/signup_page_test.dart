import 'package:client/widget/custom_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/signup_page.dart';
import 'package:client/controllers/signup_page_controller.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('SignupPage shows the correct initial widgets',
      (WidgetTester tester) async {
    // Initialize the SignupPageController
    Get.put(SignupPageController());

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: SignupPage()));

    // Verify that the correct widgets are shown initially.
    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.byType(LoginScreenButton), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
  });
}
