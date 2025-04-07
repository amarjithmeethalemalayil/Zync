import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zynk/controller/home_video/home_video_controller.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class VideoViewBox extends StatefulWidget {
  final String videoUrl;
  const VideoViewBox({super.key, required this.videoUrl});

  @override
  State<VideoViewBox> createState() => _VideoViewBoxState();
}

class _VideoViewBoxState extends State<VideoViewBox> {
  final homeVideoController = Get.put(HomeVideoController());

  @override
  void initState() {
    super.initState();
    homeVideoController.initializeVideo(widget.videoUrl);
  }

  @override
  void dispose() {
    homeVideoController.onClose();
    homeVideoController.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final videoController = homeVideoController.videoPlayerController;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: AppColors.specialBoxColor,
      ),
      child: Obx(
        () {
          return homeVideoController.isInitialized.value
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColors.specialBoxColor,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: videoController.value.size.width,
                      height: videoController.value.size.height,
                      child: VideoPlayer(
                        homeVideoController.videoPlayerController,
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
