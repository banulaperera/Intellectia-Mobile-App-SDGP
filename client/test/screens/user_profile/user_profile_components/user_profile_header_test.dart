import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/user_profile/user_profile_components/user_profile_header.dart';

void main() {
  testWidgets('UserProfileHeader Test', (WidgetTester tester) async {
    const String testName = 'user';
    const String testEmail = 'user@gmail.com';
    const String testLevel =
        '90'; //need to test again after connecting the backend
    // Build the UserProfileHeader
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UserProfileHeader(),
        ),
      ),
    );

    // Verify if the UserProfileHeader is rendered
    expect(find.byType(UserProfileHeader), findsOneWidget);

    // Verify if the name text is displayed
    expect(find.text(testName), findsOneWidget);

    // Verify if the email text is displayed
    expect(find.text(testEmail), findsOneWidget);

    // Verify if the level text is displayed
    expect(find.text(testLevel), findsOneWidget);
  });
}
