import 'package:client/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/signup_page.dart';

void main() {
  testWidgets('SignupPage UI Test', (WidgetTester tester) async {
    // Build the SignupPage widget
    await tester.pumpWidget(MaterialApp(home: SignupPage()));

    // Verify the presence of important widgets
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text("Already have an account? "), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    // Simulate tapping on the Login link
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify navigation to LoginPage
    expect(find.byType(LoginPage), findsOneWidget);
  });

  // Add more test cases as needed...
}
