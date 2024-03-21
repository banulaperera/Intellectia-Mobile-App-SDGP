import 'package:client/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/notification_page/notification_page_components/show_notification.dart';
import 'package:client/models/notification_model.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('ShowNotification Widget Test', (WidgetTester tester) async {
    Get.put(NotificationController());
    // Prepare a list of notifications for testing
    List<NotificationM> testNotifications = [
      NotificationM(id: '1', title: 'Test Notification 1', body: 'Test Body 1', type: 'Test Type 1', date: DateTime.now()),
      NotificationM(id: '2', title: 'Test Notification 2', body: 'Test Body 2', type: 'Test Type 2', date: DateTime.now()),
    ];

    // Build the ShowNotification widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ShowNotification(list: testNotifications),
        ),
      ),
    );

    // Verify if the ShowNotification widget is rendered
    expect(find.byType(ShowNotification), findsOneWidget);

    // Verify if the Slidable widget is found
    expect(find.byType(Slidable), findsWidgets);
  });
}