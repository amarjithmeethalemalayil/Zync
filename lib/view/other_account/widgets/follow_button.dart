import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class FollowButton extends StatelessWidget {
  final Function()? followUnfollow;
  final Color btnColor;
  const FollowButton({
    super.key,
    this.followUnfollow,
    this.btnColor = AppColors.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: followUnfollow,
      child: Container(
        height: 60,
        width: double.infinity,
        color: btnColor,
        child: Center(
          child: Text(
            btnColor == AppColors.secondaryColor ? "Follow" : "Following",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
