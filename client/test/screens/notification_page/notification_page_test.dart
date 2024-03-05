import 'package:client/screens/notification_page/notification_page.dart';
import 'package:client/screens/notification_page/notification_page_components/notification_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/notification_page/notification_page_components/show_notification.dart';

void main() {
  testWidgets('NotificationScreen UI Test', (WidgetTester tester) async {
    // Build NotificationScreen
    await tester.pumpWidget(const MaterialApp(home: NotificationScreen()));

    // Verify if NotificationScreen widget is found
    expect(find.byType(NotificationScreen), findsOneWidget);

    // Verify if AppBar title is displayed
    expect(find.text('Notification'), findsOneWidget);

    // Verify if "New" and "Old" sections are displayed
    expect(find.text('New'), findsOneWidget);
    expect(find.text('Old'), findsOneWidget);

    // Verify if ShowNotification widget is displayed for "New" section
    expect(find.byType(ShowNotification), findsNWidgets(2)); // Assuming newList and oldList both have notifications

    // Verify if NotificationTitle widgets are displayed
    expect(find.byType(NotificationTitle), findsAny); // Assuming 12 notifications are present in the listOfNotifications
  });
}
