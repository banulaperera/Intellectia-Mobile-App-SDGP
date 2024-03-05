import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/screens/notification_page/notification_page_components/notification_title.dart';
import 'package:client/models/notification_model.dart';

void main() {
  testWidgets('NotificationTitle Widget Test', (WidgetTester tester) async {
    // Create a Notifications object
    final Notifications notification = Notifications(
      path: 'assets/fire.png',
      titleName: 'Notification Title',
      description: 'Notification Description',
      titleTime: '2h Ago',
    );

    // Build the NotificationTitle widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NotificationTitle(notification),
        ),
      ),
    );

    // Verify if the ListTile is rendered
    expect(find.byType(ListTile), findsOneWidget);

    // Verify if the leading image is rendered
    expect(find.byType(Container), findsOneWidget);

    // Verify if the title and subtitle texts are rendered correctly
    expect(find.text(notification.titleName), findsOneWidget);
    expect(find.text(notification.titleTime), findsOneWidget);
    expect(find.text(notification.description), findsOneWidget);
  });
}
