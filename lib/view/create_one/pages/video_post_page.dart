import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/add_video/media_controller.dart';
import 'package:zynk/core/common/widgets/app_text_field.dart';
import 'package:zynk/core/common/widgets/commone_app_bar.dart';
import 'package:zynk/core/common/widgets/my_button.dart';
import 'package:zynk/view/create_one/widgets/video_preview_box.dart';

class VideoPostPage extends StatefulWidget {
  const VideoPostPage({super.key});

  @override
  State<VideoPostPage> createState() => _VideoPostPageState();
}

class _VideoPostPageState extends State<VideoPostPage> {
  final MediaController controller = Get.find<MediaController>();
  final _captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final String videoPath = Get.arguments['video'];
    if (videoPath.isNotEmpty) {
      controller.videoPath.value = videoPath;
      controller.videoFile.value = File(videoPath);
      controller.initializeVideo();
    } else {
      Get.snackbar(
        "Isssue",
        "There is an issue while picking video. Please pick again",
      );
      Get.back();
    }
  }

  @override
  void dispose() {
    controller.clearVideo();
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Obx(() {
            if (controller.videoController.value == null) {
              return const Text("Video not loaded");
            }
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Column(
                spacing: 20.0,
                children: [
                  VideoPreviewBox(
                    videoPlayerController: controller.videoController.value!,
                  ),
                  AppTextField(
                    hintText: "Caption",
                    prefixIcon: const Icon(Icons.note),
                    controller: _captionController,
                  ),
                  SizedBox(height: 10.0),
                  MyButton(
                    buttonText: "Post",
                    buttonHeight: 42.0,
                    buttonWidth: double.infinity,
                    onTap: _uploadVideo,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  void _uploadVideo() {
    if (controller.videoPath.value.isEmpty) {
      Get.snackbar("Error", "No video selected");
      return;
    }
    controller.uploadVideo(
      _captionController.text.trim(),
      controller.videoPath.value,
    );
  }
}
