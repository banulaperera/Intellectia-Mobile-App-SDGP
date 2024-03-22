import 'package:client/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/notification_page/notification_page_components/notification_title.dart';
import 'package:client/models/notification_model.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('NotificationTitle Widget Test', (WidgetTester tester) async {
    Get.put(NotificationController());
    // Prepare a notification for testing
    NotificationM testNotification = NotificationM(
      id: '1',
      title: 'Test Notification',
      body: 'Test Body',
      type: 'Test Type',
      date: DateTime.now(),
      link: 'https://test.com'
    );

    // Build the NotificationTitle widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NotificationTitle(testNotification),
        ),
      ),
    );

    // Verify if the NotificationTitle widget is rendered
    expect(find.byType(NotificationTitle), findsOneWidget);

    // Verify if the title of the notification is found
    expect(find.text('Test Notification'), findsOneWidget);

    // Verify if the body of the notification is found
    expect(find.text('Test Body'), findsOneWidget);
  });
}