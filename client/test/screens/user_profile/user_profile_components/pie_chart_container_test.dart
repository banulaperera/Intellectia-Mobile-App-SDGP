import 'package:client/screens/user_profile/user_profile_components/pie_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/user_profile/user_profile_components/pie_chart_container.dart';
import 'package:client/controllers/user_profile_controller.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('PieChartContainer shows the correct initial widgets',
      (WidgetTester tester) async {
    // Initialize the UserProfileController
    Get.put(UserProfileController());

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: PieChartContainer()));

    // Verify that the correct widgets are shown initially.
    expect(find.byType(Container), findsNWidgets(3));
    expect(find.byType(Column), findsNWidgets(2));
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Text), findsNWidgets(6));
    expect(find.text('Monthly Progress'), findsOneWidget);
    expect(find.byType(PieChartWidget), findsOneWidget);
    expect(find.byType(SizedBox), findsNWidgets(4));
  });
}
