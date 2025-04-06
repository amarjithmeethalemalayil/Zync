import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/home_slider/slider_controller.dart';
import 'package:zynk/core/constants/assets/asset_helper.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/core/common/widgets/full_screen_image_box.dart';
import 'package:zynk/view/home/widgets/home_expand_icon.dart';

class VideoViewPage extends GetView<SliderController> {
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
          body: Stack(
            children: [
              FullScreenImageBox(
                imagePath: AssetHelper.onboardingImageOne,
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    child: IconButton(
                      onPressed: onPressed,
                      icon: const Icon(Icons.menu),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Obx(
                  () {
                    final isExpanded = controller.isExpanded.value;
                    return GestureDetector(
                      onTap: controller.toggleExpand,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 60,
                        height: isExpanded ? 340 : 60,
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
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: const [
                                      HomeExpandIcon(
                                        icon: Icons.favorite,
                                        purpose: "999",
                                      ),
                                      HomeExpandIcon(
                                        icon: Icons.comment_outlined,
                                        purpose: "999",
                                      ),
                                      HomeExpandIcon(
                                        icon: Icons.share_outlined,
                                        purpose: "Share",
                                      ),
                                      HomeExpandIcon(
                                        icon: Icons.audiotrack,
                                        purpose: "Track",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
