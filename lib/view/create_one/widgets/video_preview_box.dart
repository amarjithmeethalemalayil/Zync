import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class VideoPreviewBox extends StatelessWidget {
  final VideoPlayerController videoPlayerController;
  const VideoPreviewBox({super.key, required this.videoPlayerController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.specialBoxColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        child: VideoPlayer(videoPlayerController), 
      ),
    );
  }
}

