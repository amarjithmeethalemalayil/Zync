import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zynk/controller/home_video/home_video_controller.dart';
import 'package:zynk/controller/video_stream_box.dart/videobox_controller.dart';
import 'package:zynk/core/routes/app_routes.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/model/video_model.dart';
import 'package:zynk/view/home/widgets/comment_box.dart';
import 'package:zynk/view/home/widgets/comment_box_item.dart';
import 'package:zynk/view/home/widgets/home_screen_appbar.dart';
import 'package:zynk/view/home/widgets/video_view_box.dart';

class VideoViewPage extends StatefulWidget {
  final Function()? onPressed;

  const VideoViewPage({super.key, this.onPressed});

  @override
  State<VideoViewPage> createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {
  final HomeVideoController controller = Get.find();
  final PageController _pageController = PageController();
  final _commentController = TextEditingController();
  int currentIndex = 0;

  void handlePageChange(int index) {
    final previousVideo = controller.videoList[currentIndex];
    final currentVideo = controller.videoList[index];
    final previousTag = previousVideo.videoUrl;
    final currentTag = currentVideo.videoUrl;

    if (Get.isRegistered<VideoboxController>(tag: previousTag)) {
      Get.find<VideoboxController>(tag: previousTag).pauseVideo();
    }

    currentIndex = index;

    if (Get.isRegistered<VideoboxController>(tag: currentTag)) {
      final currentController = Get.find<VideoboxController>(tag: currentTag);
      if (currentController.isInitialized.value) {
        currentController.playVideo();
      } else {
        ever(currentController.isInitialized, (isInit) {
          if (isInit == true) {
            currentController.playVideo();
          }
        });
      }
    }
  }

  void commenting(String videoId) async {
    controller.getComments(videoId);
    CommentBox.commentBox(
      child: Expanded(
        child: Obx(() {
          return controller.comments.isEmpty
              ? Center(
                  child: Text("There is no comment Yet"),
                )
              : ListView.builder(
                  itemCount: controller.comments.length,
                  itemBuilder: (context, index) {
                    final comment = controller.comments[index];
                    return CommentBoxItem(
                      username: comment.username,
                      comment: comment.comment,
                      date: comment.datePublished,
                    );
                  },
                );
        }),
      ),
      tapSend: () async {
        final comment = _commentController.text.trim();
        _commentController.clear();
        if (comment.isNotEmpty) {
          await controller.commentOnVideo(videoId, controller.uid, comment);
          controller.getComments(videoId);
        } else {
          Get.snackbar("Error", "Comment cannot be empty");
        }
      },
      commentController: _commentController,
    );
  }

  void shareVideo({
    required String? videoUrl,
    String? videoTitle,
  }) {
    final url = videoUrl ?? '';
    if (url.isEmpty) {
      debugPrint("Attempted to share a video with empty URL.");
      return;
    }
    final title = videoTitle ?? "Check out this awesome video on Zynk! 🎬";
    final message = "$title\n\nWatch now: $url";
    Share.share(
      message,
      subject: "Zynk Short Video",
    );
  }

  Color likeIconColor(Video video) {
    return video.likes.contains(controller.uid)
        ? AppColors.secondaryColor
        : AppColors.whiteColor;
  }

  @override
  void dispose() {
    _commentController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppbar(
        leadingIconTapped: widget.onPressed,
      ),
      extendBodyBehindAppBar: true,
      body: Obx(() {
        return PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: controller.videoList.length,
          onPageChanged: handlePageChange,
          itemBuilder: (context, index) {
            final video = controller.videoList[index];
            return Obx(() {
              return VideoViewBox(
                video: video,
                onPressVideoActionCircle: () => controller.toggleExpand(),
                isExpanded: controller.isExpanded.value,
                likeColor: likeIconColor(video),
                likePressed: () async => await controller.likeVideo(video.id),
                commentPressed: () => commenting(video.id),
                sharePressed: () => shareVideo(videoUrl: video.videoUrl),
                gotoAccount: () => Get.toNamed(
                  AppRoutes.accountVisiblePage,
                  arguments: {'uid': video.uid},
                ),
              );
            });
          },
        );
      }),
    );
  }
}
