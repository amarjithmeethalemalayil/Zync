import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class VideoCollectionSmallBox extends StatelessWidget {
  final String thumbnail;
  final Function()? collectionPressed;
  
  const VideoCollectionSmallBox({
    super.key,
    required this.thumbnail,
    this.collectionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: collectionPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.specialColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            thumbnail,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Center(
              child: Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
