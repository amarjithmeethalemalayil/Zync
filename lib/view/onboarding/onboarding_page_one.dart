import 'package:flutter/material.dart';
import 'package:zynk/common/widgets/my_button.dart';
import 'package:zynk/constants/assets/asset_helper.dart';
import 'package:zynk/constants/strings/app_string.dart';
import 'package:zynk/constants/theme/theme/app_theme.dart';
import 'package:zynk/view/onboarding/onboarding_page_two.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetHelper.onboardingImageOne),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          spacing: 50.0,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.onboardingScreenOneText,
              style: AppTheme.appTheme.textTheme.headlineLarge,
            ),
            MyButton(
              buttonText: "NEXT",
              buttonHeight: 70.0,
              buttonWidth: double.infinity,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OnboardingPageTwo(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
