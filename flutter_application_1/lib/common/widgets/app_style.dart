import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appTextStyle(double size, Color color,
    [FontWeight fontWeight = FontWeight.normal]) {
  return GoogleFonts.poppins(
      fontSize: size.sp, color: color, fontWeight: fontWeight);
}
