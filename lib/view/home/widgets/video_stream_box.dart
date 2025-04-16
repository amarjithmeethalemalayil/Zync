import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zynk/controller/video_stream_box.dart/videobox_controller.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class VideoStreamBox extends StatelessWidget {
  final String videoUrl;

  const VideoStreamBox({
    super.key,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideoboxController(videoUrl), tag: videoUrl);
    final size = MediaQuery.of(context).size;
    return Obx(() {
      if (!controller.isInitialized.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return Container(
        height: size.height,
        width: size.height,
        decoration: const BoxDecoration(
          color: AppColors.specialBoxColor,
        ),
        child: AspectRatio(
          aspectRatio: controller.videoPlayerController.value.size.width /
              controller.videoPlayerController.value.size.height,
          child: VideoPlayer(controller.videoPlayerController),
        ),
      );
    });
  }
}
