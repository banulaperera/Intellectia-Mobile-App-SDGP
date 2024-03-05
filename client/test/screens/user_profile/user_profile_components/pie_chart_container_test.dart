import 'package:client/screens/user_profile/user_profile_components/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/user_profile/user_profile_components/pie_chart_container.dart';

void main() {
  testWidgets('PieChartContainer Widget Test', (WidgetTester tester) async {
    // Build the PieChartContainer widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PieChartContainer(),
        ),
      ),
    );

    // Verify if the PieChartContainer widget is rendered
    expect(find.byType(Container), findsNWidgets(3));

    // Verify if the PieChartWidget is present
    expect(find.byType(PieChartWidget), findsOneWidget);

    // Verify if the QuizTile widgets are present
    expect(find.text('Correct Quizzes'), findsOneWidget);
    expect(find.text('Wrong Quizzes'), findsOneWidget);
  });
}
