import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/user_profile/user_profile_components/exp_bar_graph.dart';
import 'package:client/controllers/user_profile_controller.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('BarGraph shows the correct initial widgets',
      (WidgetTester tester) async {
    // Initialize the UserProfileController
    Get.put(UserProfileController());

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: BarGraph()));

    // Verify that the correct widgets are shown initially.
    expect(find.byType(BarChart), findsOneWidget);
  });
}
