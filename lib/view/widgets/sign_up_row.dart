import 'package:flutter/material.dart';
import 'package:zynk/constants/assets/asset_helper.dart';
import 'package:zynk/constants/theme/colors/app_colors.dart';

class SignUpRow extends StatelessWidget {
  final Function()? googleTapped;
  final Function()? fbTapped;
  final Function()? appletapped;

  const SignUpRow({
    super.key,
    this.googleTapped,
    this.fbTapped,
    this.appletapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: googleTapped,
          child: _buildCircleLogo(
            imagePath: AssetHelper.googleLogo,
          ),
        ),
        InkWell(
          onTap: fbTapped,
          child: _buildCircleLogo(
            imagePath: AssetHelper.fbLogo,
          ),
        ),
        InkWell(
          onTap: appletapped,
          child: _buildCircleLogo(
            imagePath: AssetHelper.appleLogo,
          ),
        )
      ],
    );
  }

  Widget _buildCircleLogo({
    required String imagePath,
  }) {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: AppColors.specialBoxColor,
      child: SizedBox(
        height: 31.0,
        width: 30.0,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
