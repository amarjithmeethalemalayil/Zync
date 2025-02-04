import 'package:flutter/material.dart';
import 'package:zynk/constants/assets/asset_helper.dart';
import 'package:zynk/constants/strings/app_string.dart';
import 'package:zynk/constants/theme/colors/app_colors.dart';
import 'package:zynk/constants/theme/theme/app_theme.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetHelper.onboardingImageOne),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            spacing: 50.0,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.onboardingScreenOneText,
                style: AppTheme.appTheme.textTheme.headlineLarge,
              ),
              Container(
                height: 70.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
