import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/constants.dart';
import 'package:flutter_application_1/common/widgets/app_style.dart';
import 'package:flutter_application_1/common/widgets/reusable_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ReusableText(
        style: appStyle(26, AppConstants.green, FontWeight.bold),
        text: 'Todo app with riverpod',
      ),
    ));
  }
}
