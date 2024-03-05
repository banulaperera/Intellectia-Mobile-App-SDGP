import 'package:client/screens/notification_page/notification_page_components/notification_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/notification_page/notification_page_components/show_notification.dart';
import 'package:client/models/notification_model.dart';

void main() {
  testWidgets('ShowNotification Widget Test', (WidgetTester tester) async {
    // Create a list of Notifications
    final List<Notifications> notificationsList = [
      Notifications(
        path: 'assets/youtube.png',
        titleName: 'Notification 1',
        description: 'Description 1',
        titleTime: '2h Ago',
      ),
      Notifications(
        path: 'assets/fire.png',
        titleName: 'Notification 2',
        description: 'Description 2',
        titleTime: '3h Ago',
      ),
    ];

    // Build the ShowNotification widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ShowNotification(list: notificationsList),
        ),
      ),
    );

    // Verify if the ListView.separated is rendered
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(SliverList), findsOneWidget);

    // Verify if the correct number of items is displayed
    expect(find.byType(NotificationTitle),
        findsNWidgets(notificationsList.length));
    expect(find.byType(Divider), findsNWidgets(notificationsList.length - 1));
  });
}
