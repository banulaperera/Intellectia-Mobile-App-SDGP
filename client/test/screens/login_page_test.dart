import 'package:client/widget/custom_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/login_page.dart';
import 'package:client/controllers/login_page_controller.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('LoginPage shows the correct initial widgets',
      (WidgetTester tester) async {
    // Initialize the LoginPageController
    Get.put(LoginPageController());

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify that the correct widgets are shown initially.
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(LoginScreenButton), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text("Don't have an account? "), findsOneWidget);
  });
}
