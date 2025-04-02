import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zynk/controller/add_video/media_controller.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/view/common/widgets/app_text_field.dart';
import 'package:zynk/view/common/widgets/commone_app_bar.dart';
import 'package:zynk/view/common/widgets/my_button.dart';

class VideoPostPage extends GetView<MediaController> {
  const VideoPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.clearVideo();
        return true;
      },
      child: Scaffold(
        appBar: CommonAppBar(),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Obx(() {
                      final videoController = controller.videoController.value;
                      if (videoController == null) {
                        return const Center(child: Text("Video failed to load"));
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.6,
                          color: AppColors.specialBoxColor,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: videoController.value.size.width,
                              height: videoController.value.size.height,
                              child: VideoPlayer(videoController),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    AppTextField(
                      hintText: "Track Name",
                      prefixIcon: const Icon(Icons.person_pin_circle),
                      controller: controller.titleController,
                    ),
                    const SizedBox(height: 10),
                    AppTextField(
                      hintText: "Caption",
                      prefixIcon: const Icon(Icons.note),
                      controller: controller.captionController, 
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                      buttonText: "Post",
                      buttonHeight: 42.0,
                      buttonWidth: double.infinity,
                      onTap: _uploadVideo,
                    ),
                  ],
                ),
              ),
            ),
          ],
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
      controller.titleController.text.trim(),
      controller.captionController.text.trim(),
      controller.videoPath.value,
    );
    print("posted");
  }
}
