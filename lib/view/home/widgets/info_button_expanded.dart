import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class InfoButtonExpanded extends StatelessWidget {
  final int like;
  final int commentCount;
  final int shreCount;
  final Color likeIconColor;
  final Function()? onPressedLike, onPressedComment, onPressedShare;
  const InfoButtonExpanded({
    super.key,
    required this.like,
    required this.commentCount,
    required this.shreCount,
    this.onPressedLike,
    this.onPressedComment,
    this.onPressedShare,
    this.likeIconColor = AppColors.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _homeExpandedIcon(
              onPressed: onPressedLike,
              icon: Icons.favorite,
              likeIconColor: likeIconColor,
              purpose: like.toString(),
            ),
            _homeExpandedIcon(
              onPressed: onPressedComment,
              icon: Icons.comment_outlined,
              purpose: commentCount.toString(),
            ),
            _homeExpandedIcon(
              onPressed: onPressedShare,
              icon: Icons.share_outlined,
              purpose: shreCount.toString(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeExpandedIcon({
    required IconData icon,
    required String purpose,
    Color likeIconColor = AppColors.whiteColor,
    required Function()? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        spacing: 10.0,
        children: [
          InkWell(
            onTap: onPressed,
            child: Icon(icon, color: likeIconColor, size: 28),
          ),
          Text(
            purpose,
            style: TextStyle(color: AppColors.whiteColor, fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
