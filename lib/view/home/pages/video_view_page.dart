import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/home_slider/slider_controller.dart';
import 'package:zynk/controller/home_video/home_video_controller.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/view/home/widgets/info_button_expanded.dart';
import 'package:zynk/view/home/widgets/video_view_box.dart';

class VideoViewPage extends GetView<SliderController> {
  final Function()? onPressed;

  const VideoViewPage({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final homeVideoController = Get.put(HomeVideoController());
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
                itemCount: homeVideoController.videoList.length,
                scrollDirection: Axis.vertical,
                controller: PageController(
                  initialPage: 0,
                  viewportFraction: 1,
                ),
                itemBuilder: (context, index) {
                  final video = homeVideoController.videoList[index];
                  return Stack(
                    children: [
                      VideoViewBox(videoUrl: video.videoUrl),
                      _accountInfoSection(),
                      _bottomCircleIcon(),
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

  Widget _bottomCircleIcon() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Obx(() {
        final isExpanded = controller.isExpanded.value;
        return _infoButton(isExpanded: isExpanded);
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
    required bool isExpanded,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20.0),
      child: GestureDetector(
        onTap: controller.toggleExpand,
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
              if (isExpanded) InfoButtonExpanded(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _accountInfoSection() {
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
            children: [
              Text("Username"),
              Text("SongName"),
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
