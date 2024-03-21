import 'package:client/constants.dart';
import 'package:client/screens/login_page.dart';
import 'package:client/screens/navigation_bar.dart';
import 'package:client/screens/splash_screens/splash_screen.dart';
import 'package:client/util/cron_job_util.dart';
import 'package:client/util/local_storage.dart';
import 'package:client/util/notification_service.dart';
import 'package:client/util/refresh_token.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initializeNotification();
  CronJob().initializeJobs();
  final bool onboardStatus= await LocalStorage().getOnboardStatus();
  final bool tokenExpired=await checkRefreshTokenIsExpired();
  runApp( MyApp(onboardStatus:onboardStatus,tokenExpired:tokenExpired));
}

class MyApp extends StatelessWidget {
  final bool onboardStatus;
  final bool tokenExpired;
  const MyApp({super.key,required this.onboardStatus, required this.tokenExpired,});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intellectia',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: onboardStatus ? const SplashScreen():(tokenExpired ? LoginPage():const BottomNavigation(0)),
      navigatorKey: navigatorKey,
    );
  }
}
