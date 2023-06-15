// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_1/common/widgets/app_style.dart';
import 'package:flutter_application_1/common/widgets/reusable_text.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    this.buttonColor,
    required this.borderColor,
    required this.height,
    required this.width,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final Function() onTap;
  final Color? buttonColor;
  final Color borderColor;
  final double height;
  final double width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
          ),
          child: Center(
              child: ReusableText(
                  text: text,
                  style: appTextStyle(18, borderColor, FontWeight.bold))),
        ));
  }
}
