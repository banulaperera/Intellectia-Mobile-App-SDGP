import 'package:client/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoginScreenButton Test', (WidgetTester tester) async {
    // Define a mock onPressed function
    bool onPressedCalled = false;
    mockOnPressed() {
      onPressedCalled = true;
    }

    // Build the LoginScreenButton
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginScreenButton(
            label: 'Login',
            onPressed: mockOnPressed,
          ),
        ),
      ),
    );

    // Verify if the LoginScreenButton is rendered
    expect(find.byType(LoginScreenButton), findsOneWidget);

    // Verify if the button label is displayed
    expect(find.text('Login'), findsOneWidget);

    // Simulate a tap on the button
    await tester.tap(find.text('Login'));
    await tester.pump();

    // Verify if onPressed callback is called
    expect(onPressedCalled, true);
  });
}
