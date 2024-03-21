import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/splash_screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('SplashScreen Widget Test', (WidgetTester tester) async {
    // Build the SplashScreen widget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: SplashScreen(),
      ),
    );

    // Verify if the SplashScreen widget is rendered
    expect(find.byType(SplashScreen), findsOneWidget);

    // Verify if the "Get Started" button is found
    expect(find.text('Get Started'), findsOneWidget);
  });
}