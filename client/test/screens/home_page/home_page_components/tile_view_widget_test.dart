import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/home_page/home_page_components/tile_view_widget.dart';
import 'package:client/models/tile_model.dart';
import 'package:client/models/note.dart';

void main() {
  testWidgets('TileViewWidget Widget Test', (WidgetTester tester) async {
    // Prepare a tile and note for testing
    Note testNote = Note(
      id: '1',
      title: 'Test Note',
      content: 'Test Content',
      moduleName: 'Test Module',
      createdDate: DateTime.now(),
      lastModifiedDate: DateTime.now(),
    );
    TileModel testTile = TileModel(
      title: 'Test Tile',
      tiles: [testNote],
    );

    // Build the TileViewWidget widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TileViewWidget(tile: testTile),
        ),
      ),
    );

    // Verify if the TileViewWidget widget is rendered
    expect(find.byType(TileViewWidget), findsOneWidget);

    // Verify if the ExpansionTile widget is found
    expect(find.byType(ExpansionTile), findsOneWidget);

    // Verify if the Slidable widget is found
    expect(find.byType(Slidable), findsWidgets);
  });
}