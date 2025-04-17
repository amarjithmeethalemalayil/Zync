import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zynk/model/user_model.dart';

class FindOtherAccountController extends GetxController {
  final FirebaseAuth auth;
  final FirebaseFirestore db;

  FindOtherAccountController(this.auth, this.db);

  final Rxn<UserModel> _user = Rxn<UserModel>();
  UserModel? get user => _user.value;
  final RxBool isFollowing = false.obs;
  final RxBool isLoading = false.obs;
  final RxInt followingCount = RxInt(0);
  final RxString currentUserid = RxString('');

  Future<void> findUser(String uid) async {
    try {
      isLoading.value = true;
      final doc = await db.collection('accounts').doc(uid).get();
      if (doc.exists && doc.data() != null) {
        _user.value = UserModel.fromJson(doc.data()!);
        await checkFollowing(uid);
      } else {
        _user.value = null;
      }
    } catch (e) {
      _user.value = null;
    } finally {
      isLoading.value = false;
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
      followingCount.value = followingList.length;
    } catch (e) {
      isFollowing.value = false;
      print("Error checking following status: $e");
    }
  }

  Future<void> followUser(String otherUid) async {
    final currentUid = auth.currentUser?.uid;
    currentUserid.value = currentUid ?? "unknown";

    if (currentUid == null) {
      Get.snackbar("Error", "User not logged in");
      return;
    }

    try {
      final currentUserDoc =
          await db.collection('accounts').doc(currentUid).get();
      final otherUserDoc = await db.collection('accounts').doc(otherUid).get();

      if (!currentUserDoc.exists || !otherUserDoc.exists) {
        Get.snackbar("Error", "User does not exist");
        return;
      }

      List<dynamic> followingList = currentUserDoc.data()?['following'] ?? [];
      List<dynamic> followersList = otherUserDoc.data()?['followers'] ?? [];

      // Print the data for debugging
      print("Current User Following: $followingList");
      Get.snackbar("Info", "Current User Following: $followingList");
      print("Other User Followers: $followersList");

      if (followingList.contains(otherUid)) {
        // Unfollow: Remove from following list and followers list
        await db.collection('accounts').doc(currentUid).update({
          'following': FieldValue.arrayRemove([otherUid]),
        });
        await db.collection('accounts').doc(otherUid).update({
          'followers': FieldValue.arrayRemove([currentUid]),
        });
        isFollowing.value = false; // Update follow status to false
        Get.snackbar("Unfollowed", "You have unfollowed $otherUid");
      } else {
        // Follow: Add to following list and followers list
        await db.collection('accounts').doc(currentUid).update({
          'following': FieldValue.arrayUnion([otherUid]),
        });
        await db.collection('accounts').doc(otherUid).update({
          'followers': FieldValue.arrayUnion([currentUid]),
        });
        isFollowing.value = true; // Update follow status to true
        Get.snackbar("Following", "You are now following $otherUid");
      }
    } catch (e) {
      print("Error: $e"); // Print any errors
      Get.snackbar("Error", "Failed to follow/unfollow user: ${e.toString()}");
    }
  }

  @override
  void onClose() {
    _user.close();
    isFollowing.close();
    isLoading.close();
    super.onClose();
  }
}
