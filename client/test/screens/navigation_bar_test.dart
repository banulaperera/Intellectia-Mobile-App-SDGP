import 'package:client/screens/navigation_bar.dart';
import 'package:client/screens/notification_page/notification_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/home_page/home_page.dart';
import 'package:client/screens/quiz/welcome/welcome_screen.dart';
import 'package:client/screens/user_profile/user_profile_main_screen.dart';

void main() {
  testWidgets('BottomNavigation shows the correct initial screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: BottomNavigation(0)));

    // Verify that the correct screen is shown initially.
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(WelcomeScreen), findsNothing);
    expect(find.byType(NotificationScreen), findsNothing);
    expect(find.byType(UserProfile), findsNothing);
  });
}
