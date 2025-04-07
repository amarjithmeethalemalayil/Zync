import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zynk/model/video_model.dart';

class HomeVideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  RxBool isInitialized = false.obs;
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  List<Video> get videoList => _videoList.value;
  final db = FirebaseFirestore.instance;

  @override
  void onInit() {
    _videoList.bindStream(
      db.collection("videos").snapshots().map(
        (QuerySnapshot snapshot) {
          List<Video> videoList = [];
          for (var doc in snapshot.docs) {
            // final _video = Video.fromFirestore(doc);
            // videoList.add(_video);
            videoList.add(Video.fromFirestore(doc));
          }
          return videoList;
        },
      ),
    );
    super.onInit();
  }

  void initializeVideo(String url) {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    videoPlayerController.initialize().then((_) {
      isInitialized.value = true;
      videoPlayerController
        ..play()
        ..setVolume(1)
        ..setLooping(true);
    });
    //isInitialized.value = false;
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
