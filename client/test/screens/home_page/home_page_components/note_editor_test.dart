import 'package:client/controllers/note_controller.dart';
import 'package:client/models/note.dart';
import 'package:client/screens/home_page/home_page_components/note_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets(
    'CreateNote Widget Test',
    (WidgetTester tester) async {
      Get.put(NoteController());
      // Prepare a note for testing
      Note testNote = Note(
        id: '1',
        title: 'Test Note',
        content: 'Test Content',
        moduleName: 'Test Module',
        createdDate: DateTime.now(),
        lastModifiedDate: DateTime.now(),
      );

      // Build the CreateNote widget
      await tester.pumpWidget(
        GetMaterialApp(
          home: CreateNote(notes: testNote),
        ),
      );

      // Verify if the CreateNote widget is rendered
      expect(find.byType(CreateNote), findsOneWidget);

      // Verify if the title TextFormField is found
      expect(find.byKey(const Key('title')), findsOneWidget);

      // Verify if the content TextFormField is found
      expect(find.byKey(const Key('content')), findsOneWidget);

      // Verify if the floating action button is found
      expect(find.byType(FloatingActionButton), findsOneWidget);
    },
  );

  testWidgets('CreateNote Pop-up Functionality Test',
      (WidgetTester tester) async {
    Get.put(NoteController());
    // Build the CreateNote widget
    await tester.pumpWidget(const MaterialApp(home: CreateNote()));

    // Tap on the floating action button to show the pop-up
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
  });
}
