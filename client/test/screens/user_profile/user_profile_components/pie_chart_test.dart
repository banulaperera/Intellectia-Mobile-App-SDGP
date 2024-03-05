import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:client/screens/user_profile/user_profile_components/pie_chart.dart';

void main() {
  testWidgets('PieChartWidget Test', (WidgetTester tester) async {
    // Build the PieChartWidget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PieChartWidget(),
        ),
      ),
    );

    // Verify if the PieChartWidget is rendered
    expect(find.byType(PieChart), findsOneWidget);

    // Verify if the 'Quiz Progress' text is displayed
    expect(find.text('Quiz Progress'), findsOneWidget);

    // Verify if the chart data is displayed correctly
    expect(find.byWidgetPredicate((widget) {
      if (widget is PieChart) {
        return widget.data.sections.length == pieChartData.length;
      }
      return false;
    }), findsOneWidget);
  });
}
