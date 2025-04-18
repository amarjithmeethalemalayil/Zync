import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class VideoCollectionSmallErrorBox extends StatelessWidget {
  const VideoCollectionSmallErrorBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.specialColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Center(child: Text("Error")),
    );
  }
}
