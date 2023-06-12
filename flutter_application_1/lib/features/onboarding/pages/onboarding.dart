import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/constants.dart';
import 'package:flutter_application_1/common/widgets/app_style.dart';
import 'package:flutter_application_1/common/widgets/custom_sizedbox.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/widgets/reusable_text.dart';

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
            children: const [PageOne(), PageTwo()],
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
                        style:
                            appStyle(16, AppConstants.light, FontWeight.w500),
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

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.height,
      width: AppConstants.width,
      color: AppConstants.bkDark,
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.height,
      width: AppConstants.width,
      color: AppConstants.bkDark,
    );
  }
}
