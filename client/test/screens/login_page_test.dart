import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/login_page.dart';
import 'package:client/screens/signup_page.dart';

void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    // Build our LoginPage widget wrapped in MaterialApp
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // Verify the presence of important widgets
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text("Don't have an account? "), findsOneWidget);
    expect(find.text('Signup'), findsOneWidget);

    // Simulate tapping on the Signup link
    await tester.press(find.text('Signup'), warnIfMissed: false);
    await tester.pumpAndSettle();

    // Verify navigation to SignupPage
    expect(find.byType(SignupPage), findsOneWidget);
  });
}
