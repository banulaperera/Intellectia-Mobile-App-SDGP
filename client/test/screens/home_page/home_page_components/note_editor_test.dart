import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/home_page/home_page.dart';
import 'package:client/screens/home_page/home_page_components/note_editor.dart';

void main() {
  testWidgets('CreateNote UI Test', (WidgetTester tester) async {
    // Build the CreateNote widget
    await tester.pumpWidget(MaterialApp(home: CreateNote()));

    // Verify the presence of important widgets
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byIcon(Icons.save), findsOneWidget);
  });

  testWidgets('CreateNote Pop-up UI Test', (WidgetTester tester) async {
    // Build the CreateNote widget
    await tester.pumpWidget(MaterialApp(home: CreateNote()));

    // Tap on the floating action button to show the pop-up
    await tester.press(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Verify the presence of pop-up elements
    expect(find.byType(SimpleDialog), findsOneWidget);
    expect(find.text('Module Name'), findsOneWidget);
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Option 3'), findsOneWidget);
    expect(find.text('Custom Module Name'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Apply'), findsOneWidget);
  });

  testWidgets('CreateNote Pop-up Functionality Test', (WidgetTester tester) async {
    // Build the CreateNote widget
    await tester.pumpWidget(MaterialApp(home: CreateNote()));

    // Tap on the floating action button to show the pop-up
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Tap on the 'Apply' button
    await tester.tap(find.text('Apply'));
    await tester.pumpAndSettle();

    // Verify navigation back to the HomePage
    expect(find.byType(HomePage), findsOneWidget);
  });
}
