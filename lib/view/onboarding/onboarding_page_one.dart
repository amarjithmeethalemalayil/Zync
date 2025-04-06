import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:zynk/core/constants/assets/asset_helper.dart';
import 'package:zynk/core/constants/strings/app_string.dart';
import 'package:zynk/core/routes/app_routes.dart';
import 'package:zynk/core/theme/theme/app_theme.dart';
import 'package:zynk/core/common/widgets/full_screen_image_box.dart';
import 'package:zynk/core/common/widgets/my_button.dart';

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
            onTap: () => Get.offNamed(AppRoutes.getStarted),
          ),
        ],
      ),
    ));
  }
}
