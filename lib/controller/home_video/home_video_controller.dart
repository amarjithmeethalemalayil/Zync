import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zynk/model/video_model.dart';

class HomeVideoController extends GetxController {
  final FirebaseFirestore db;
  final FirebaseAuth auth;

  HomeVideoController({
    required this.auth,
    required this.db,
  });
  late VideoPlayerController videoPlayerController;
  RxBool isInitialized = false.obs;
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  List<Video> get videoList => _videoList.value;

  late String uid;

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
    uid = auth.currentUser!.uid;
  }

  void likeVideo(String id) async {
    DocumentSnapshot doc = await db.collection("videos").doc(id).get();
    if (!doc.exists) {
      Get.snackbar("Error", "Video not found");
      return;
    }
    final data = doc.data() as Map<String, dynamic>?;
    final likes = data?['likes'] as List<dynamic>? ?? [];
    if (likes.contains(uid)) {
      await db.collection("videos").doc(id).update({
        "likes": FieldValue.arrayRemove([uid]),
      });
    } else {
      await db.collection("videos").doc(id).update({
        "likes": FieldValue.arrayUnion([uid]),
      });
    }
  }
}
