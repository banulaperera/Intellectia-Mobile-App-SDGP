import 'package:client/screens/user_profile/user_profile_components/user_profile_header.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UserProfileHeader Test', (WidgetTester tester) async {
    // Initialize the UserProfileController with mock data
    // var userProfileController = Get.put(UserProfileController());
    // userProfileController.user = User(
    //     photo: '',
    //     firstName: 'Test',
    //     lastName: 'User',
    //     email: 'testuser@gmail.com',
    //     level: 1,
    //     correctedQuestions: 0,
    //     inCorrectedQuestions: 0,
    //     totalXP: 0,
    //     weeklyXP: []);
    //
    // // Build the UserProfileHeader widget
    // await tester.pumpWidget(
    //   const MaterialApp(
    //     home: Scaffold(
    //       body: UserProfileHeader(),
    //     ),
    //   ),
    // );

    // Verify if the UserProfileHeader widget is rendered
    expect(find.byType(UserProfileHeader), findsOneWidget);

    // Verify if the user's name is displayed
    expect(find.text('Test User'), findsOneWidget);

    // Verify if the user's email is displayed
    expect(find.text('testuser@gmail.com'), findsOneWidget);

    // Verify if the user's level is displayed
    expect(find.text('Level 1'), findsOneWidget);
  });
}
