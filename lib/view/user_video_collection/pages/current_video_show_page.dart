import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/current_user_profile/current_user_profile_controller.dart';
import 'package:zynk/core/common/widgets/collection_video_show_page.dart';
import 'package:zynk/core/common/widgets/commone_app_bar.dart';
import 'package:zynk/model/video_model.dart';

class CurrentVideoShowPage extends StatefulWidget {
  const CurrentVideoShowPage({super.key});

  @override
  State<CurrentVideoShowPage> createState() => _CurrentVideoShowPageState();
}

class _CurrentVideoShowPageState extends State<CurrentVideoShowPage> {
  final controller = Get.find<CurrentUserProfileController>();
  late Video video;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Video;
    video = args;
    controller.initializeVideoPlayer(video);
  }

  @override
  void dispose() {
    controller.closeVideoController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return CollectionVideoContent(
          caption: video.caption,
          likeCount: video.likes.length,
          videoController: controller.videoController,
        );

        // return SingleChildScrollView(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "Caption : ${video.caption}",
        //         style:
        //             const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        //       ),
        //       const SizedBox(height: 10),
        //       Text("No.of Like : ${video.likes.length}"),
        //       const SizedBox(height: 20),
        //       if (controller.videoController.value.isInitialized)
        //         AspectRatio(
        //           aspectRatio: controller.videoController.value.aspectRatio,
        //           child: VideoPlayer(controller.videoController),
        //         ),
        //     ],
        //   ),
        // );
      }),
    );
  }
}
