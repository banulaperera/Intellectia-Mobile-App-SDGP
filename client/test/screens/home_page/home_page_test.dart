import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/screens/home_page/home_page.dart';
import 'package:client/screens/home_page/home_page_components/note_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomePage UI Test', (WidgetTester tester) async {
    // Build the HomePage widget
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // Verify the presence of important widgets
    expect(find.text('Notes'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(BootstrapIcons.filter), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byIcon(BootstrapIcons.plus,), findsOneWidget);

    // Tap on the floating action button to add a new note
    await tester.press(find.byType(FloatingActionButton));
    await tester.pump();

    // Verify navigation to NoteEditor
    // expect(find.byWidget(CreateNote()), findsOneWidget);

    // You can add more test cases as needed...
  });
}
