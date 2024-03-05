import 'package:client/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/login_page.dart';

void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    // Build our LoginPage widget
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // Verify that the LoginPage contains necessary widgets
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text("Don't have an account? "), findsOneWidget);
    expect(find.text('Signup'), findsOneWidget);

    // Perform tap on Signup text to navigate to SignupPage
    final signUpTextFinder = find.text('Signup');
    await tester.ensureVisible(signUpTextFinder); // Scroll to bring widget into view
    await tester.tap(signUpTextFinder);
    // Wait for navigation transition to complete
    await tester.pumpAndSettle();
    // Verify that navigation to SignupPage occurred
    expect(find.byType(SignupPage), findsOneWidget);

    // Go back to LoginPage
    Navigator.pop(tester.element(find.text('Login'),),);
    await tester.pumpAndSettle();

    // Perform tap on Forgot Password? text
    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle();

    // Verify that forgot password action is triggered
    // Add more assertions based on the expected behavior of the LoginPage
  });
}
