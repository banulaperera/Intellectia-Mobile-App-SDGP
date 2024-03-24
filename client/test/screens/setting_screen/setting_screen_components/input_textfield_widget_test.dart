import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/setting_screen/setting_screen_components/input_textfield_widget.dart';

void main() {
  testWidgets('InputTextField Widget Test', (WidgetTester tester) async {
    // Build the InputTextField widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputTextField(
            labelText: 'Test Label',
            hintText: 'Test Hint',
            obscuredProperty: false,
            controller: TextEditingController(),
          ),
        ),
      ),
    );

    // Verify if the InputTextField widget is rendered
    expect(find.byType(InputTextField), findsOneWidget);

    // Verify if the labelText is found
    expect(find.text('Test Label'), findsOneWidget);

    // Verify if the hintText is found
    expect(find.text('Test Hint'), findsOneWidget);
  });
}