import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/notification_page/notification_page.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('NotificationScreen Widget Test', (WidgetTester tester) async {
    // Build the NotificationScreen widget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: NotificationScreen(),
      ),
    );

    // Verify if the NotificationScreen widget is rendered
    expect(find.byType(NotificationScreen), findsOneWidget);

    // Verify if the "Notification" title is found
    expect(find.text('Notification'), findsOneWidget);
  });
}