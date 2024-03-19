import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/features/splash/splash_screen.dart';
import 'package:flutter_application_1/constants/features/splash/welcome.dart';
import 'package:flutter_application_1/detail_audio_page.dart';
import 'package:flutter_application_1/fav_books.dart';
import 'package:flutter_application_1/myscreen.dart';
import 'package:flutter_application_1/navigation_bar.dart';
import 'package:flutter_application_1/otp_ver.dart';
import 'package:flutter_application_1/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gyani kitab",
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
