import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/app_style.dart';
import '../../../common/widgets/custom_sizedbox.dart';
import '../../../common/widgets/reusable_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  'assets/images/todo.png',
                  width: AppConstants.height * .5,
                ),
              ),
              const CustomSizedBox(
                height: 26,
              ),
              ReusableText(
                  text: 'Enter your OPT code',
                  style: appTextStyle(18, AppConstants.light)),
              const CustomSizedBox(
                height: 26,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  if (value.length == 6) {}
                },
                onSubmitted: (value) {
                  if (value.length == 6) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
