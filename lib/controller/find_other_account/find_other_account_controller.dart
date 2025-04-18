import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zynk/model/user_model.dart';
import 'package:zynk/model/video_model.dart';

class FindOtherAccountController extends GetxController {
  final FirebaseAuth auth;
  final FirebaseFirestore db;

  FindOtherAccountController(this.auth, this.db);

  final Rxn<UserModel> _user = Rxn<UserModel>();
  UserModel? get user => _user.value;
  final RxBool isFollowing = false.obs;
  final RxBool isLoading = false.obs;
  late VideoPlayerController videoController;
  late String currentUid;
  Video? video;

  @override
  void onInit() {
    currentUid = auth.currentUser!.uid;
    super.onInit();
  }

  Future<void> findUser(String uid) async {
    try {
      final doc = await db.collection('accounts').doc(uid).get();
      if (doc.exists && doc.data() != null) {
        _user.value = UserModel.fromJson(doc.data()!);
        await checkFollowing(uid);
      } else {
        _user.value = null;
      }
    } catch (e) {
      _user.value = null;
    }
  }

  Future<void> checkFollowing(String otherUid) async {
    final currentUid = auth.currentUser?.uid;
    if (currentUid == null) {
      isFollowing.value = false;
      return;
    }
    try {
      final doc = await db.collection('accounts').doc(currentUid).get();
      final data = doc.data() ?? <String, dynamic>{};
      final List<dynamic> followingList =
          (data['following'] as List<dynamic>?) ?? [];
      isFollowing.value = followingList.contains(otherUid);
    } catch (e) {
      isFollowing.value = false;
      print("Error checking following status: $e");
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

  Future<void> followUser(String otherUid) async {
    if (currentUid.isEmpty) {
      Get.snackbar("Error", "User not logged in");
      return;
    }
    try {
      final collection = db.collection("accounts");
      final currentUserDoc = await collection.doc(currentUid).get();
      final otherUserDoc = await collection.doc(otherUid).get();
      if (!currentUserDoc.exists || !otherUserDoc.exists) {
        Get.snackbar("Error", "User does not exist");
        return;
      } else {
        final following = (currentUserDoc['following'] as List<dynamic>?) ?? [];
        final followers = (otherUserDoc['followers'] as List<dynamic>?) ?? [];
        if (following.contains(otherUid) || followers.contains(currentUid)) {
          await collection.doc(currentUid).update({
            'following': FieldValue.arrayRemove([otherUid]),
          });
          await collection.doc(otherUid).update({
            'followers': FieldValue.arrayRemove([currentUid])
          });
          isFollowing.value = false;
        } else {
          await collection.doc(currentUid).update({
            'following': FieldValue.arrayUnion([otherUid]),
          });
          await collection.doc(otherUid).update({
            'followers': FieldValue.arrayUnion([currentUid])
          });
          isFollowing.value = true;
        }
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "Failed to follow/unfollow user: ${e.toString()}");
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

  @override
  void onClose() {
    _user.close();
    isFollowing.close();
    isLoading.close();
    super.onClose();
  }
}
