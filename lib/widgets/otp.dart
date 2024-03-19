import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPBox extends StatefulWidget {
  const OTPBox({Key? key}) : super(key: key);

  @override
  _OTPBoxState createState() => _OTPBoxState();
}

class _OTPBoxState extends State<OTPBox> {
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      margin: const EdgeInsets.all(18),
      fieldWidth: 60,
      textStyle: const TextStyle(color: Colors.black),
      numberOfFields: 4,
      fillColor: Colors.white,
      filled: true,
      enabledBorderColor: Colors.white,
      focusedBorderColor: Colors.blue, // Change border color when focused
      showFieldAsBox: true,
      onCodeChanged: (String code) {
        // handle validation or checks here
      },
      onSubmit: (String verificationCode) {
        print(verificationCode);
      },
    );
  }
}
