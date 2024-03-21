import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/splash_screens/info_screen.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('InfoScreen Widget Test', (WidgetTester tester) async {
    // Build the InfoScreen widget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: InfoScreen(),
      ),
    );

    // Verify if the InfoScreen widget is rendered
    expect(find.byType(InfoScreen), findsOneWidget);

    // Verify if the "Continue" button is found
    expect(find.text('Continue'), findsOneWidget);
  });
}