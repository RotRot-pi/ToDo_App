// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_1/common/utils/constants.dart';
import 'package:flutter_application_1/common/widgets/app_style.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const CustomTextField({
    Key? key,
    this.keyboardType,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.hintStyle,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.width * .9,
      decoration: BoxDecoration(
        color: AppConstants.light,
        borderRadius: BorderRadius.circular(AppConstants.radius),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        cursorHeight: 25,
        onChanged: onChanged,
        style: appTextStyle(18, AppConstants.bkDark, FontWeight.w700),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconColor: AppConstants.bkDark,
          hintStyle: hintStyle,
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.red,
                width: 0.5,
              )),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.red,
                width: 0.5,
              )),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: AppConstants.greyBk,
                width: 0.5,
              )),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: AppConstants.bkDark,
                width: 0.5,
              )),
        ),
      ),
    );
  }
}
