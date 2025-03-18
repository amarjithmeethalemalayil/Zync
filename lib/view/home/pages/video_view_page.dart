import 'package:flutter/material.dart';
import 'package:zynk/core/constants/assets/asset_helper.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/view/common/widgets/full_screen_image_box.dart';
import 'package:zynk/view/home/widgets/home_expand_icon.dart';

class VideoViewPage extends StatefulWidget {
  final Function()? onPressed;

  const VideoViewPage({
    super.key,
    this.onPressed,
  });

  @override
  State<VideoViewPage> createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {
  bool _isExpanded = false;

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
                  padding: const EdgeInsets.only(left: 20.0,top: 20.0),
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    child: IconButton(
                      onPressed: widget.onPressed,
                      icon: const Icon(Icons.menu),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 60,
                    height: _isExpanded ? 340 : 60,
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
                              _isExpanded
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                        if (_isExpanded)
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
