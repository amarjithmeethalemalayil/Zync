import 'package:flutter/material.dart';
import 'package:zynk/model/video_model.dart';
import 'package:zynk/view/home/widgets/video_account_info_section.dart';
import 'package:zynk/view/home/widgets/video_action_circle.dart';
import 'package:zynk/view/home/widgets/video_stream_box.dart';

class VideoViewBox extends StatelessWidget {
  final Video video;
  final bool isExpanded;
  final Color? likeColor;
  final Function()? onPressVideoActionCircle,
      likePressed,
      commentPressed,
      sharePressed, gotoAccount;

  const VideoViewBox({
    super.key,
    required this.video,
    required this.isExpanded,
    this.likeColor,
    this.likePressed,
    this.commentPressed,
    this.sharePressed,
    this.onPressVideoActionCircle, this.gotoAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoStreamBox(videoUrl: video.videoUrl),
        VideoAccountinfoSection(
          username: video.username,
          caption: video.caption,
          gotoAccount: gotoAccount,
        ),
        VideoActionCircle(
          onPressVideoActionCircle: onPressVideoActionCircle,
          isExpanded: isExpanded,
          likeCount: video.likes.length,
          likeColor: likeColor,
          likePressed: likePressed,
          commentCount: video.commentCount,
          commentPressed: commentPressed,
          sharePressed: sharePressed,
        ),
      ],
    );
  }
}
