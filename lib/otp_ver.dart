import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/ui_colors.dart';
// import 'package:flutter_application_1/constants/widgets/button.dart';
// import 'package:flutter_application_1/constants/widgets/otp.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/otp.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBlue,
      appBar: AppBar(
        backgroundColor: AppColor.lightBlue,
        elevation: 0,
        iconTheme: const IconThemeData(
            color: Colors.black), // Set the back button color
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "OTP Verification",
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Enter the verification code we just sent on your email address.",
              style: TextStyle(fontSize: 20, color: AppColor.grey),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const OTPBox(),
          const SizedBox(
            height: 16,
          ),
          Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: RoundedButton(
                text: "Verify",
                onpressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                width: MediaQuery.of(context).size.width * .9,
              ),
            ),
          )
        ],
      ),
    );
  }
}
