import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/features/splash/splash_screen.dart';
import 'package:flutter_application_1/constants/features/splash/welcome.dart';
import 'package:flutter_application_1/constants/profile/profile.dart';
import 'package:flutter_application_1/myscreen.dart';
import 'package:flutter_application_1/navigation_bar.dart';
import 'package:flutter_application_1/otp_ver.dart';

class Routes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String otp = '/otp';
  static const String profile = '/profile';
  static const String home = '/home';
  static const String nav = '/nav';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.otp:
        return MaterialPageRoute(builder: (_) => const OTPVerification());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const myscreen());
      case Routes.nav:
        return MaterialPageRoute(builder: (_) => NavBar());
      default:
        // Handle unknown routes
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Error Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
