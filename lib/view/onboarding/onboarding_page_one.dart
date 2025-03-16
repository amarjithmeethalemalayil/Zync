import 'package:flutter/material.dart';
import 'package:zynk/constants/assets/asset_helper.dart';
import 'package:zynk/constants/strings/app_string.dart';
import 'package:zynk/constants/theme/theme/app_theme.dart';
import 'package:zynk/view/onboarding/onboarding_page_two.dart';
import 'package:zynk/view/widgets/full_screen_image_box.dart';
import 'package:zynk/view/widgets/my_button.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FullScreenImageBox(
      imagePath: AssetHelper.onboardingImageOne,
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
    ));
  }
}
