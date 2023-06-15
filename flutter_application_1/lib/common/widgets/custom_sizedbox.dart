import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({super.key, this.height = 0, this.width = 0});
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
    );
  }
}
