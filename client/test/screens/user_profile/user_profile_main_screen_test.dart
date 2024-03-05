import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/screens/user_profile/user_profile_components/exp_bar_graph.dart';
import 'package:client/screens/user_profile/user_profile_components/pie_chart_container.dart';
import 'package:client/screens/user_profile/user_profile_components/user_profile_header.dart';
import 'package:client/screens/user_profile/user_profile_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UserProfile UI Test', (WidgetTester tester) async {
    // Build UserProfile widget
    await tester.pumpWidget(const MaterialApp(home: UserProfile()));

    // Verify if UserProfile widget is found
    expect(find.byType(UserProfile), findsOneWidget);

    // Verify if AppBar title is displayed
    expect(find.text('My Profile'), findsOneWidget);

    // Verify if action button is displayed
    expect(find.byIcon(BootstrapIcons.gear_wide_connected), findsOneWidget);

    // Verify if UserProfileHeader widget is displayed
    expect(find.byType(UserProfileHeader), findsOneWidget);

    // Verify if XP Earned section is displayed correctly
    expect(find.text('XP Earned'), findsOneWidget);

    // Verify if BarGraph widget is displayed
    expect(find.byType(BarGraph), findsOneWidget);

    // Verify if PieChartContainer widget is displayed
    expect(find.byType(PieChartContainer), findsOneWidget);
  });
}
