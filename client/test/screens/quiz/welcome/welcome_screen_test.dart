import 'package:flutter/Material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/quiz/welcome/welcome_screen.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('WelcomeScreen Widget Test', (WidgetTester tester) async {
    // Build the WelcomeScreen widget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: WelcomeScreen(),
      ),
    );

    // Verify if the WelcomeScreen widget is rendered
    expect(find.byType(WelcomeScreen), findsOneWidget);

    // Verify if the Scaffold widget is found
    expect(find.byType(Scaffold), findsOneWidget);

    // Verify if the Text widget with "Are you ready for the quiz?" is found
    expect(find.text('Are you ready for the quiz?'), findsOneWidget);

    // Verify if the Text widget with "Let's Start Quiz" is found
    expect(find.text("Let's Start Quiz"), findsOneWidget);
  });
}