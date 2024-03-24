import 'package:client/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoginSignUpTextField Test', (WidgetTester tester) async {
    // Create a TextEditingController
    final TextEditingController controller = TextEditingController();

    // Build the LoginSignUpTextField
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginSignUpTextField(
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            controller: controller,
          ),
        ),
      ),
    );

    // Verify if the LoginSignUpTextField is rendered
    expect(find.byType(LoginSignUpTextField), findsOneWidget);

    // Verify if the hintText is displayed
    expect(find.text('Enter your email'), findsOneWidget);

    // Simulate entering text into the TextField
    await tester.enterText(find.byType(TextField), 'example@gmail.com');

    // Verify if the controller captures the input text properly
    expect(controller.text, 'example@gmail.com');
  });
}
