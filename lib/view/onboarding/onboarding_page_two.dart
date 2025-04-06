import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zynk/controller/onboarding/onboarding_controller.dart';
import 'package:zynk/core/constants/assets/asset_helper.dart';
import 'package:zynk/core/constants/strings/app_string.dart';
import 'package:zynk/core/common/widgets/full_screen_image_box.dart';
import 'package:zynk/core/common/widgets/my_button.dart';

class OnboardingPageTwo extends GetView<OnboardingController> {
  const OnboardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FullScreenImageBox(
        imagePath: AssetHelper.onboardingImageTwo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 50.0,
          children: [
            Text(
              AppString.onboardingScreenTwoText,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            MyButton(
              buttonText: "Get Started",
              buttonHeight: 70.0,
              buttonWidth: double.infinity,
              onTap: () => controller.completeOnboarding(),
            ),
          ],
        ),
      ),
    );
  }
}
