import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zynk/model/user_model.dart';
import 'package:zynk/model/video_model.dart';

class CurrentUserProfileController extends GetxController {
  final FirebaseAuth auth;
  final FirebaseFirestore db;

  CurrentUserProfileController(this.auth, this.db);

  String? uid;
  var userProfile = Rxn<UserModel>();
  Video? video;
  late VideoPlayerController videoController;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    uid = auth.currentUser?.uid;
    fetchCurrentUser();
  }

  Future<void> fetchCurrentUser() async {
    if (uid == null) return;
    try {
      final doc = await db.collection('accounts').doc(uid).get();
      if (doc.exists && doc.data() != null) {
        userProfile.value =
            UserModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        userProfile.value = null;
        Get.snackbar("Error", "User profile not found.");
      }
    } catch (e) {
      Get.snackbar("Error", "fetching user profile: $e");
      userProfile.value = null;
    }
  }

  Future<Video?> findVideoCollection(String videoDocId) async {
    try {
      final DocumentSnapshot snap =
          await db.collection("videos").doc(videoDocId).get();

      final Video video = Video.fromFirestore(snap);
      return video;
    } catch (e) {
      print('Error fetching video: $e');
      return null;
    }
  }

  void initializeVideoPlayer(Video videoModel) {
    video = videoModel;
    videoController = VideoPlayerController.network(video!.videoUrl)
      ..initialize().then((_) {
        isLoading.value = false;
        videoController.play();
        videoController.setLooping(true);
        update();
      }).catchError((error) {
        isLoading.value = false;
        print("Error initializing video: $error");
      });
  }

  void closeVideoController() {
    videoController.dispose();
  }
}
