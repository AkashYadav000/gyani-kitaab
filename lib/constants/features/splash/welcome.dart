import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/text_field.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          // Image.asset(
          //   'assets/images/booklibvector.jpg',
          //   fit: BoxFit.cover,
          // ),

          // Centered logo
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5 - 30,
            left: MediaQuery.of(context).size.width * 0.5 - 100,
            child: Image.asset(
              'assets/images/booklibvector.jpg',
              width: 200,
              height: 200,
            ),
          ),

          // Login text field and button
          Positioned(
            bottom: 80,
            left: 16,
            right: 16,
            child: Column(
              children: [
                const CustomTextField(),
                const SizedBox(height: 24),
                Material(
                  color: Colors.transparent,
                  child: RoundedButton(
                    text: "Login",
                    onpressed: () {
                      Navigator.pushNamed(context, '/otp');
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
