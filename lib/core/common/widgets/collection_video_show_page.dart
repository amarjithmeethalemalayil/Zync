import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CollectionVideoContent extends StatelessWidget {
  final String caption;
  final int likeCount;
  final VideoPlayerController videoController;

  const CollectionVideoContent({
    super.key,
    required this.caption,
    required this.likeCount,
    required this.videoController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Caption : $caption",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text("No.of Like : $likeCount"),
          const SizedBox(height: 20),
          if (videoController.value.isInitialized)
            AspectRatio(
              aspectRatio: videoController.value.aspectRatio,
              child: VideoPlayer(videoController),
            ),
        ],
      ),
    );
  }
}
