import 'package:flutter/material.dart';

import 'routes.dart';
import 'screens/analytics_screen.dart';
import 'screens/announcements_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/chairman_home_screen.dart';
import 'screens/chat_conversation_screen.dart';
import 'screens/leadership_profiles_screen.dart';
import 'screens/login_screen.dart';
import 'screens/messages_screen.dart';
import 'screens/president_home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/rankings_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/reports_screen.dart';
import 'screens/reset_password_screen.dart';
import 'screens/video_meeting_screen.dart';
import 'ui/app_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SK 360° - Youth Governance Platform',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Geist',
        fontFamilyFallback: const ['Arial', 'Helvetica', 'Segoe UI'],
      ),
      routes: {
        AppRoutes.registration: (context) => const RegistrationScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.resetPassword: (context) => const ResetPasswordScreen(),
        AppRoutes.presidentHome: (context) => const PresidentHomeScreen(),
        AppRoutes.chairmanHome: (context) => const ChairmanHomeScreen(),
        AppRoutes.presidentMessages: (context) => const MessagesScreen(),
        AppRoutes.presidentCalendar: (context) => const CalendarScreen(),
        AppRoutes.chatConversation: (context) => const ChatConversationScreen(),
        AppRoutes.videoMeeting: (context) => const VideoMeetingScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.announcements: (context) => const AnnouncementsScreen(),
        AppRoutes.leadershipProfiles: (context) => const LeadershipProfilesScreen(),
        AppRoutes.analytics: (context) => const AnalyticsScreen(),
        AppRoutes.rankings: (context) => const RankingsScreen(),
        AppRoutes.reports: (context) => const ReportsScreen(),
      },
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToRegistration();
  }

  Future<void> _navigateToRegistration() async {
    await Future.delayed(const Duration(seconds: 5));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RegistrationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrayBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _SplashLogo(),
            SizedBox(height: 32),
            Text(
              'SK 360°',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGray,
              ),
            ),
            SizedBox(height: 80),
            Text(
              'Empowering Youth Governance',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.lightText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SplashLogo extends StatelessWidget {
  const _SplashLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.primaryRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(
        Icons.shield,
        size: 60,
        color: AppColors.white,
      ),
    );
  }
}
