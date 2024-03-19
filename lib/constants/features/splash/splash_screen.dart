import 'dart:async';

// import 'package:fish_tutor/src/constants/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/ui_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Delay for 2 seconds before showing the waves with easing in effect
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = 1.0;
      });
    });

    // Navigate to welcome screen after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Layered waves
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 2),
              child: Image.asset('assets/images/booklibvector.jpg'),
            ),
          ),

          // Centered logo
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5 - 100,
            left: MediaQuery.of(context).size.width * 0.5 - 100,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 2),
              child: Image.asset(
                'assets/images/booklibvector.jpg',
                width: 200,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
