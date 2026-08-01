import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';

import 'screens/auth/login/login_screen.dart';
import 'screens/auth/register/register_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/report/report_lost_screen.dart';
import 'screens/report/report_found_screen.dart';
import 'screens/search/search_screen.dart';
import 'screens/reports/my_reports_screen.dart';
import 'screens/notifications/notifications_screen.dart';
import 'screens/profile/profile_screen.dart';

class LostAndFoundApp extends StatelessWidget {
  const LostAndFoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lost & Found",
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,

      routes: {
  AppRoutes.splash: (context) => const SplashScreen(),
  AppRoutes.login: (context) => const LoginScreen(),
  AppRoutes.register: (context) => const RegisterScreen(),
  AppRoutes.home: (context) => const HomeScreen(),

  AppRoutes.reportLost: (context) => const ReportLostScreen(),
  AppRoutes.reportFound: (context) => const ReportFoundScreen(),
  AppRoutes.search: (context) => const SearchScreen(),
  AppRoutes.reports: (context) => const MyReportsScreen(),
  AppRoutes.notifications: (context) => const NotificationsScreen(),
  AppRoutes.profile: (context) => const ProfileScreen(),
},
    );
  }
}