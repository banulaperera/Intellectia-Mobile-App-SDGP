import 'package:client/screens/user_profile/user_profile_components/exp_bar_graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BarGraph Widget Test', (WidgetTester tester) async {
    // Build the BarGraph widget
    await tester.pumpWidget(
     const MaterialApp(
        home: Scaffold(
          body: BarGraph(),
        ),
      ),
    );

    // Verify if the BarGraph widget is rendered
    expect(find.byType(BarChart), findsOneWidget);

    // Verify if the BarGraph widget has correct data
    expect(find.text('S'), findsAtLeastNWidgets(2));
    expect(find.text('M'), findsOneWidget);
    expect(find.text('T'), findsAtLeastNWidgets(2));
    expect(find.text('W'), findsOneWidget);
    expect(find.text('F'), findsOneWidget);
  });
}
