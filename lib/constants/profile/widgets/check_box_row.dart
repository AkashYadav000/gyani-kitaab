import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/ui_colors.dart';

class CheckboxRow extends StatefulWidget {
  final String text;
  final Function(bool) onChecked;

  const CheckboxRow({
    Key? key,
    required this.text,
    required this.onChecked,
  }) : super(key: key);

  @override
  _CheckboxRowState createState() => _CheckboxRowState();
}

class _CheckboxRowState extends State<CheckboxRow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: const BorderSide(color: Colors.blue),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              widget.onChecked(value);
            });
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
              widget.onChecked(isChecked);
            });
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.text,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColor.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
