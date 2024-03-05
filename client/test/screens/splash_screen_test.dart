import 'package:client/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/splash_screen.dart';

void main() {
  testWidgets('SplashScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));
    expect(find.byType(RichText), findsAtLeastNWidgets(2));
    expect(find.text('Get Started'), findsOneWidget);

    // Tap on the Get Started button
    await tester.tap(find.text("Get Started"));
    await tester.pumpAndSettle();

    // Verify if the splash screen is navigated to login page after tapping Get Started button
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
