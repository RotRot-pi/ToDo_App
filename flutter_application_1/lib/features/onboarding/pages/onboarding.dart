import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/constants.dart';
import 'package:flutter_application_1/common/widgets/app_style.dart';
import 'package:flutter_application_1/common/widgets/custom_outline_bottom.dart';
import 'package:flutter_application_1/common/widgets/custom_sizedbox.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/widgets/reusable_text.dart';
import '../../auth/pages/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: const [_PageOne(), _PageTwo()],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pageController.nextPage(
                              duration: const Duration(microseconds: 600),
                              curve: Curves.ease);
                        },
                        child: const Icon(
                          Ionicons.chevron_forward_circle,
                          size: 30,
                          color: AppConstants.light,
                        ),
                      ),
                      const CustomSizedBox(
                        width: 5,
                      ),
                      ReusableText(
                        text: 'Skip',
                        style: appTextStyle(
                            16, AppConstants.light, FontWeight.w500),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 2,
                      effect: const WormEffect(
                          dotHeight: 12,
                          dotWidth: 16,
                          spacing: 10,
                          activeDotColor: AppConstants.yellow),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PageOne extends StatelessWidget {
  const _PageOne();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.height,
      width: AppConstants.width,
      color: AppConstants.bkDark,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset('assets/images/todo.png'),
            ),
            const CustomSizedBox(
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReusableText(
                  text: 'Todo With Riverpod',
                  style: appTextStyle(30, AppConstants.light, FontWeight.w600),
                ),
                const CustomSizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    'Do you want to make todo list fast and with ease',
                    textAlign: TextAlign.center,
                    style: appTextStyle(
                      16,
                      AppConstants.light,
                    ),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}

class _PageTwo extends StatelessWidget {
  const _PageTwo();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.height,
      width: AppConstants.width,
      color: AppConstants.bkDark,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset('assets/images/todo.png'),
            ),
            const CustomSizedBox(
              height: 50,
            ),
            CustomOutlineButton(
                borderColor: AppConstants.light,
                height: AppConstants.height * .06,
                width: AppConstants.width * .9,
                text: 'Login with phone number',
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                })
          ]),
    );
  }
}
