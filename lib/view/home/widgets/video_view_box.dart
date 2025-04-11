import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewBox extends StatefulWidget {
  final String videoUrl;
  const VideoViewBox({super.key, required this.videoUrl});

  @override
  State<VideoViewBox> createState() => _VideoViewBoxState();
}

class _VideoViewBoxState extends State<VideoViewBox> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((_) {
            setState(() {
              videoPlayerController.play();
              videoPlayerController.setVolume(1);
            });
          });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child:videoPlayerController.value.isInitialized ? AspectRatio(
        aspectRatio: videoPlayerController.value.aspectRatio,
        child: VideoPlayer(videoPlayerController),
      ) :
      Center(child: Text("loading"),)
    );
  }
}
