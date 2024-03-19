import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/profile/widgets/check_box_row.dart';
import 'package:flutter_application_1/constants/profile/widgets/text_field.dart';
import 'package:flutter_application_1/widgets/button.dart';

import '../../constants/ui_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Text(
                  "Create your profile",
                  style: TextStyle(fontSize: 32, color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Enter Information for your new account",
                  style: TextStyle(fontSize: 20, color: AppColor.grey),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const CustomInputField(hintText: "Name"),
              const CustomInputField(hintText: "Email"),
              const CustomInputField(hintText: "House Number"),
              const CustomInputField(hintText: "Address"),
              const Row(
                children: [
                  CustomInputField(
                    hintText: "PinCode",
                    width: 155,
                  ),
                  CustomInputField(
                    hintText: "City/Town",
                    width: 155,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CheckboxRow(
                text: "I agree the Terms and Condition of FishTutor",
                onChecked: (bool value) {},
              ),
              CheckboxRow(
                text: "I agree to the Privacy Policy of FishTutor",
                onChecked: (bool value) {},
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Material(
                  color: Colors.transparent,
                  child: RoundedButton(
                    text: "Create Account",
                    onpressed: () {
                      Navigator.pushNamed(context, '/nav');
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
