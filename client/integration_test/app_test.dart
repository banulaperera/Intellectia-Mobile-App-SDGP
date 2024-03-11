import 'package:client/screens/home_page/home_page.dart';
import 'package:client/screens/login_page.dart';
import 'package:client/screens/notification_page/notification_page.dart';
import 'package:client/screens/quiz/welcome/welcome_screen.dart';
import 'package:client/screens/signup_page.dart';
import 'package:client/screens/user_profile/user_profile_main_screen.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'end to end testing',
    () {
      testWidgets(
        'navigation from splash screen to the login screen',
        (widgetTester) async {
          app.main();
          await widgetTester.pumpAndSettle();
          await widgetTester.tap(find.text('Get Started'));
          await widgetTester.pumpAndSettle();

          // Verify if the LoginPage is pushed after tapping the button
          expect(find.byType(LoginPage), findsOneWidget);
        },
      );

      testWidgets(
        'log in to the application with correct username and password',
        (widgetTester) async {
          app.main();
          await widgetTester.pumpAndSettle();
          await widgetTester.tap(find.text('Get Started'));
          await widgetTester.pumpAndSettle();

          // Verify if the LoginPage is pushed after tapping the button
          expect(find.byType(LoginPage), findsOneWidget);

          await widgetTester.enterText(
            find.byKey(const Key('username')),
            'u1@gmail.com',
          );
          await widgetTester.enterText(
            find.byKey(const Key('password')),
            'u1',
          );
          await widgetTester.tap(find.byKey(const Key('loginKey')));
          await widgetTester.pumpAndSettle();

          // Verify if the HomePage is pushed after tapping the button
          expect(find.byType(HomePage), findsOneWidget);
        },
      );

      testWidgets(
        'Go to the sign up page from the login page',
        (widgetTester) async {
          await launchApp(widgetTester);

          expect(find.byType(LoginPage), findsOneWidget);

          await widgetTester.tap(
            find.byKey(
              const Key('signupKey'),
            ),
          );
          await widgetTester.pumpAndSettle();

          // Verify if the Signup is pushed after tapping the button
          expect(find.byType(SignupPage), findsOneWidget);
        },
      );

      testWidgets(
        'Test whether the user can register',
        (widgetTester) async {
          await launchApp(widgetTester);

          expect(find.byType(LoginPage), findsOneWidget);

          await widgetTester.tap(
            find.byKey(
              const Key('signupKey'),
            ),
          );
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(
              find.byKey(
                const ValueKey('signupEmail'),
              ),
              'u2@gmail.com');
          await widgetTester.enterText(find.byType(TextField).at(0), 'u2');
          await widgetTester.enterText(find.byType(TextField).at(1), 'u2');
          await widgetTester.tap(
            find.text('Sign Up'),
          );
          await widgetTester.pumpAndSettle();
          expect(find.byType(SignupPage), findsOneWidget);
        },
      );
    },
  );

  group(
    'end to end testing with navigation bar',
    () {
      testWidgets(
        'test whether the user can navigate to the different tabs in the application after logging in',
        (WidgetTester widgetTester) async {
          await launchApp(widgetTester);

          await login(widgetTester, 'u1@gmail.com', 'u1');

          // Verify if the HomePage is pushed after tapping the button
          // Verify if the initial screen is the HomePage
          expect(find.byType(HomePage), findsOneWidget);

          // // Tap on the 'Quiz' tab
          await widgetTester.tap(find.text('Quiz'));
          await widgetTester.pump();

          // Verify if the screen changes to the Quiz screen
          expect(find.byType(WelcomeScreen), findsOneWidget);

          // // Tap on the 'Notification' tab
          await widgetTester.tap(find.text('Notification'));
          await widgetTester.pump();

          // // Verify if the screen changes to the Notification screen
          expect(find.byType(NotificationScreen), findsOneWidget);

          // Tap on the 'Profile' tab
          await widgetTester.tap(find.text('Profile'));
          await widgetTester.pump();

          // Verify if the screen changes to the UserProfile screen
          expect(find.byType(UserProfile), findsOneWidget);
        },
      );

      testWidgets(
        'testing',
        (widgetTester) async {
          await launchApp(widgetTester);
          await login(widgetTester, 'u1@gmail.com', 'u1');

          // Verify if the HomePage is pushed after tapping the button

          await widgetTester.enterText(
              find.byKey(const Key('searchKey')), 'OOP');

          await Future.delayed(const Duration(seconds: 1));
          final searchText = find.text('OOP');
          expect(searchText, findsAtLeastNWidgets(1));
          await Future.delayed(const Duration(seconds: 1));


          //verify the note adding functionality
          await widgetTester.press(find.byType(FloatingActionButton));
          await widgetTester.pumpAndSettle();
          await widgetTester.enterText(find.byKey(const Key('title')), 'title');
          await widgetTester.enterText(find.byKey(const Key('content')), 'content');
          await widgetTester.press(find.byType(FloatingActionButton));
          await widgetTester.pumpAndSettle();
          Future.delayed(const Duration(seconds: 1));
        },
      );
    },
  );


}

Future<void> launchApp(WidgetTester widgetTester) async {
  app.main();
  await widgetTester.pumpAndSettle();
  await widgetTester.tap(find.text('Get Started'));
  await widgetTester.pumpAndSettle();
}

Future<void> login(WidgetTester widgetTester, String username, String password) async {
  await widgetTester.enterText(find.byKey(const Key('username')), username);
  await widgetTester.enterText(find.byKey(const Key('password')), password);
  await widgetTester.tap(find.text('Login'));
  await widgetTester.pumpAndSettle();
}
