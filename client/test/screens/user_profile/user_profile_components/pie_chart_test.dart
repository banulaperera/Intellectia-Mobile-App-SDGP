import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:client/screens/user_profile/user_profile_components/pie_chart.dart';
import 'package:get/get.dart';
import 'package:client/controllers/user_profile_controller.dart';

void main() {
  testWidgets('PieChartWidget Test', (WidgetTester tester) async {
    // Initialize the UserProfileController
    Get.put(UserProfileController());

    // Build the PieChartWidget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: Scaffold(
          body: PieChartWidget(),
        ),
      ),
    );

    // Verify if the PieChartWidget is rendered
    expect(find.byType(PieChart), findsOneWidget);

    // Verify if the 'Quiz Progress' text is displayed
    expect(find.text('Quiz Progress'), findsOneWidget);
  });
}