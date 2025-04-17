import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/home_slider/slider_controller.dart';

import 'package:zynk/view/home/pages/slider_view_page.dart';
import 'package:zynk/view/home/pages/video_view_page.dart';

class SliderHandlePage extends StatefulWidget {
  const SliderHandlePage({super.key});

  @override
  State<SliderHandlePage> createState() => _SliderHandlePageState();
}

class _SliderHandlePageState extends State<SliderHandlePage> {
  final sliderController = Get.find<SliderController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return Scaffold(
      body: Stack(
        children: [
          SliderViewPage(
            onPressed: () => sliderController.toggleCollapse(),
          ),
          Obx(() {
            final isCollapsed = sliderController.isCollapsed.value;
            return AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: isCollapsed ? 0 : 0.2 * height,
              bottom: isCollapsed ? 0 : 0.2 * width,
              left: isCollapsed ? 0 : 0.6 * width,
              right: isCollapsed ? 0 : -0.4 * width,
              child: ClipRRect(
                borderRadius: sliderController.isCollapsed.value
                    ? BorderRadius.circular(0)
                    : BorderRadius.circular(30.0),
                child: VideoViewPage(
                  onPressed: () => sliderController.toggleCollapse(),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
