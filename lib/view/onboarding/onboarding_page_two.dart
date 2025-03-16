import 'package:flutter/material.dart';
import 'package:zynk/constants/assets/asset_helper.dart';
import 'package:zynk/constants/strings/app_string.dart';
import 'package:zynk/view/auth/auth_decision_page.dart';
import 'package:zynk/view/widgets/full_screen_image_box.dart';
import 'package:zynk/view/widgets/my_button.dart';

class OnboardingPageTwo extends StatelessWidget {
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
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthDecisionPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
