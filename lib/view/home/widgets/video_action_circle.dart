import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/view/home/widgets/info_button_expanded.dart';

class VideoActionCircle extends StatelessWidget {
  final bool isExpanded;
  final int likeCount, commentCount;
  final Color? likeColor;
  final Function()? onPressVideoActionCircle, likePressed, commentPressed, sharePressed;
  const VideoActionCircle({
    super.key,
    required this.isExpanded,
    this.likePressed,
    this.commentPressed,
    this.sharePressed,
    required this.likeCount,
    required this.commentCount,
    this.likeColor, this.onPressVideoActionCircle,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50.0,
      right: 20.0,
      child: Material(
        color: AppColors.transparentColor,
        child: GestureDetector(
          onTap: onPressVideoActionCircle,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 60,
            height: isExpanded ? 290 : 60,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.specialBoxColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: AnimatedCrossFade(
              firstChild: CircleAvatar(
                radius: 30.0,
                backgroundColor: AppColors.specialBoxColor,
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: AppColors.whiteColor,
                  size: 28,
                ),
              ),
              secondChild: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: isExpanded
                    ? SingleChildScrollView(
                        child: InfoButtonExpanded(
                          likeCount: likeCount,
                          likeIconColor: likeColor,
                          likeOnTap: likePressed,
                          commentCount: commentCount,
                          commentOnTap: commentPressed,
                          shareOnTap: sharePressed,
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
      ),
    );
  }
}
