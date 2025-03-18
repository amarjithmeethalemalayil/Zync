import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class BuildSelectionText extends StatelessWidget {
  final bool isSignUp;
  final Function()? onTap;

  const BuildSelectionText({
    super.key,
    this.isSignUp = false,
   this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: isSignUp ? "Already have an account" : "Don't have an account? ",
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 16.0,
        ),
        children: [
          TextSpan(
            text: isSignUp ? "Sign in" : "Sign up",
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
