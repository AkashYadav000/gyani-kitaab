// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import '../../../constants/ui_colors.dart';

class RoundedButton extends StatelessWidget {
  String text;
  double? width;
  Function onpressed;
  RoundedButton({
    Key? key,
    required this.text,
    required this.onpressed,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 50,
      width: width ?? MediaQuery.of(context).size.width,
      child: Material(
        color: Colors.transparent,
        child: ElevatedButton(
          onPressed: () => onpressed(),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            )),
            backgroundColor: MaterialStateProperty.all(AppColor.darkBlue),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
