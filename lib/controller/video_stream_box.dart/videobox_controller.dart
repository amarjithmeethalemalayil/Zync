import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoboxController extends GetxController {
  final String videoUrl;
  late VideoPlayerController videoPlayerController;
  var isInitialized = false.obs;

  VideoboxController(this.videoUrl);

  @override
  void onInit() {
    super.onInit();
    _initializeVideo();
  }

  void _initializeVideo() async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await videoPlayerController.initialize();
    videoPlayerController
      ..play()
      ..setVolume(1)
      ..setLooping(true);
    isInitialized.value = true;
  }

  void pauseVideo() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
    }
  }

  void playVideo() {
    if (!videoPlayerController.value.isPlaying && isInitialized.value) {
      videoPlayerController.play();
    }
  }

  @override
  void onClose() {
    videoPlayerController.pause();
    videoPlayerController.dispose();
    super.onClose();
  }
}
 