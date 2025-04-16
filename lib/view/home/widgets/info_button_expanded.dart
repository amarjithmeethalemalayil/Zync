import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class InfoButtonExpanded extends StatelessWidget {
  final Color? likeIconColor;
  final int likeCount, commentCount;
  final Function()? likeOnTap, commentOnTap, shareOnTap;

  const InfoButtonExpanded({
    super.key,
    this.likeIconColor,
    required this.likeCount,
    required this.commentCount,
    this.likeOnTap,
    this.commentOnTap,
    this.shareOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Center(
        child: Column(
          spacing: 5.0,
          children: [
            _expandedIcon(iconData: Icons.keyboard_arrow_down),
            _commoneSpace(),
            _expandedIcon(
                iconData: Icons.favorite,
                iconColor: likeIconColor,
                onTap: likeOnTap),
            _countShowText(
              context,
              likeCount.toString(),
            ),
            _commoneSpace(),
            _expandedIcon(
              iconData: Icons.comment_outlined,
              onTap: commentOnTap,
            ),
            _countShowText(
              context,
              commentCount.toString(),
            ),
            _commoneSpace(),
            _expandedIcon(
              iconData: Icons.share_outlined,
              onTap: shareOnTap,
            ),
            _countShowText(
              context,
              "Share"
            ),
          ],
        ),
      ),
    );
  }

  Widget _countShowText(BuildContext ctx, String purpose) {
    return Text(
      purpose,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 12.0,
      ),
    );
  }

  Widget _expandedIcon({
    required IconData iconData,
    Color? iconColor,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        iconData,
        size: 28.0,
        color: iconColor ?? AppColors.whiteColor,
      ),
    );
  }

  Widget _commoneSpace() {
    return SizedBox(
      height: 8.0,
    );
  }
}
