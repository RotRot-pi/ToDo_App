import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/constants.dart';
import 'package:flutter_application_1/common/widgets/app_style.dart';
import 'package:flutter_application_1/common/widgets/custom_outline_bottom.dart';
import 'package:flutter_application_1/common/widgets/custom_sizedbox.dart';
import 'package:flutter_application_1/common/widgets/custom_textfield.dart';
import 'package:flutter_application_1/common/widgets/reusable_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'otp.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final TextEditingController phone;
  Country country = Country(
    phoneCode: '1',
    countryCode: "US",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "USA",
    example: "USA",
    displayName: "United States",
    displayNameNoCountryCode: "US",
    e164Key: "",
  );
  @override
  void initState() {
    phone = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Image.asset(
                    'assets/images/todo.png',
                    width: 250.w,
                  ),
                ),
                const CustomSizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 16.w),
                  child: ReusableText(
                    style:
                        appTextStyle(17, AppConstants.light, FontWeight.w500),
                    text: 'Please enter your phone number',
                  ),
                ),
                const CustomSizedBox(
                  height: 20,
                ),
                Center(
                  child: CustomTextField(
                    hintText: "Enter phone number",
                    hintStyle: appTextStyle(
                      16,
                      AppConstants.bkDark,
                      FontWeight.w600,
                    ),
                    keyboardType: TextInputType.phone,
                    prefixIcon: Container(
                        padding: const EdgeInsets.all(4),
                        child: GestureDetector(
                          onTap: () {
                            showCountryPicker(
                                context: context,
                                countryListTheme: CountryListThemeData(
                                    backgroundColor: AppConstants.bkDark,
                                    bottomSheetHeight: AppConstants.height * .6,
                                    textStyle:
                                        appTextStyle(10, AppConstants.light),
                                    borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(AppConstants.radius),
                                      topRight:
                                          Radius.circular(AppConstants.radius),
                                    )),
                                onSelect: (code) {
                                  setState(() {});
                                });
                          },
                          child: ReusableText(
                            style: appTextStyle(
                                18, AppConstants.bkDark, FontWeight.bold),
                            text: "${country.flagEmoji} + ${country.phoneCode}",
                          ),
                        )),
                  ),
                ),
                const CustomSizedBox(
                  height: 20,
                ),
                CustomOutlineButton(
                    borderColor: AppConstants.bkDark,
                    buttonColor: AppConstants.light,
                    height: AppConstants.height * .07,
                    width: AppConstants.width * .9,
                    text: 'Send Code',
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtpPage()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
