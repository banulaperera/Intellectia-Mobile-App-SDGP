import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/home_page/home_page.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('HomePage Widget Test', (WidgetTester tester) async {
    // Build the HomePage widget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: HomePage(),
      ),
    );

    // Verify if the HomePage widget is rendered
    expect(find.byType(HomePage), findsOneWidget);

    // Verify if the "Notes" title is found
    expect(find.text('Notes'), findsOneWidget);

    // Verify if the search TextField is found
    expect(find.byKey(const Key('searchKey')), findsOneWidget);

    // Verify if the floating action button is found
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}