import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/home_slider/slider_controller.dart';
import 'package:zynk/controller/home_video/home_video_controller.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/view/home/widgets/comment_box.dart';
import 'package:zynk/view/home/widgets/comment_box_item.dart';
import 'package:zynk/view/home/widgets/info_button_expanded.dart';
import 'package:zynk/view/home/widgets/video_view_box.dart';

class VideoViewPage extends GetView<HomeVideoController> {
  final Function()? onPressed;

  const VideoViewPage({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 40,
      borderRadius: BorderRadius.circular(40.0),
      shadowColor: AppColors.specialBoxColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: _leadingIcon(),
            backgroundColor: Colors.transparent,
          ),
          body: Obx(
            () {
              return PageView.builder(
                itemCount: controller.videoList.length,
                scrollDirection: Axis.vertical,
                controller: PageController(
                  initialPage: 0,
                  viewportFraction: 1,
                ),
                itemBuilder: (context, index) {
                  final video = controller.videoList[index];
                  return Stack(
                    children: [
                      VideoViewBox(videoUrl: video.videoUrl),
                      _accountInfoSection(
                        username: video.username,
                        caption: video.caption,
                      ),
                      _bottomCircleIcon(
                        likeCont: video.likes.length,
                        commentCount: video.commentCount,
                        shareCount: video.shareCount,
                        likeColor: video.likes.contains(controller.uid)
                            ? AppColors.secondaryColor
                            : AppColors.whiteColor,
                        onPressedComment: () => onPressCommentBox(
                          commentCount: video.commentCount,
                          username: "hi",
                          comment: "how are you ",
                        ),
                        onPressedLike: () {
                          controller.likeVideo(video.id);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void onPressCommentBox({
    required int commentCount,
    required String username,
    required String comment,
  }) {
    commentBox(
      child: Expanded(
        child: ListView.builder(
          itemCount: 40,
          itemBuilder: (context, index) {
            return CommentBoxItem();
          },
        ),
      ),
    );
  }

  Widget _bottomCircleIcon({
    required int likeCont,
    required int commentCount,
    required int shareCount,
    required Color likeColor,
    required Function() onPressedLike,
    required Function() onPressedComment,
  }) {
    final sliderController = Get.find<SliderController>();
    return Align(
      alignment: Alignment.bottomRight,
      child: Obx(() {
        final isExpanded = sliderController.isExpanded.value;
        return _infoButton(
          isExpanded: isExpanded,
          likeCont: likeCont,
          commentCount: commentCount,
          shareCount: shareCount,
          onPressedLike: onPressedLike,
          onTap: sliderController.toggleExpand,
          likeColor: likeColor,
          onPressedComment: onPressedComment,
        );
      }),
    );
  }

  Widget _leadingIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.whiteColor,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.menu),
        ),
      ),
    );
  }

  Widget _infoButton({
    required Function()? onTap,
    required bool isExpanded,
    required int likeCont,
    required int commentCount,
    required int shareCount,
    required Color likeColor,
    required Function() onPressedLike,
    required Function() onPressedComment,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 60,
          height: isExpanded ? 290 : 60,
          decoration: BoxDecoration(
            color: AppColors.specialBoxColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: Center(
                  child: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              if (isExpanded)
                InfoButtonExpanded(
                  like: likeCont,
                  commentCount: commentCount,
                  shreCount: shareCount,
                  onPressedLike: onPressedLike,
                  likeIconColor: likeColor,
                  onPressedComment: onPressedComment,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _accountInfoSection({
    required String username,
    required String caption,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20.0),
      child: Row(
        spacing: 20.0,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.specialBoxColor,
            radius: 30.0,
            child: Icon(
              Icons.person,
              size: 20.0,
              color: AppColors.geryColor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username),
              Text(caption),
              SizedBox(
                height: 8.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
