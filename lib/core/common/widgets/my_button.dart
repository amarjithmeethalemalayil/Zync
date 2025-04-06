import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final double buttonHeight;
  final double buttonWidth;
  final Function() onTap;

  const MyButton({
    super.key,
    required this.buttonText,
    required this.buttonHeight,
    required this.buttonWidth, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
