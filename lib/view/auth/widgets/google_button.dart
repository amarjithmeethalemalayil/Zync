import 'package:flutter/material.dart';
import 'package:zynk/core/constants/assets/asset_helper.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      width: 284.0,
      decoration: BoxDecoration(
        color: AppColors.specialBoxColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 46.0,
            child: Image.asset(
              AssetHelper.googleLogo,
              fit: BoxFit.cover,
            ),
          ),
          Text("continue with google"),
        ],
      ),
    );
  }
}
