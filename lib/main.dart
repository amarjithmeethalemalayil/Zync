import 'package:flutter/material.dart';
import 'package:zynk/constants/theme/theme/app_theme.dart';
import 'package:zynk/view/onboarding/onboarding_page_one.dart';

void main() {
  runApp(const  MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zynk',
      theme: AppTheme.appTheme,
      home: const OnboardingPageOne()
    );
  }
}
