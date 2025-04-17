import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zynk/model/comment.dart';
import 'package:zynk/model/video_model.dart';

class HomeVideoController extends GetxController {
  final FirebaseFirestore db;
  final FirebaseAuth auth;

  HomeVideoController({
    required this.auth,
    required this.db,
  });
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  List<Video> get videoList => _videoList.value;
  final Rx<List<Comment>> _comments = Rx<List<Comment>>([]);
  List<Comment> get comments => _comments.value;

  late String uid;
  var isExpanded = false.obs;

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

  void toggleExpand() {
    isExpanded.value = !isExpanded.value;
  }

  Future<void> likeVideo(String id) async {
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

  Future<void> commentOnVideo(
    String videoId,
    String uid,
    String comment,
  ) async {
    try {
      final querySnapshot = await db
          .collection('accounts')
          .where('uid', isEqualTo: uid)
          .limit(1)
          .get();
      if (querySnapshot.docs.isEmpty) {
        print("No user found with that UID");
        return;
      }
      final username = querySnapshot.docs.first['name'];
      final userComment = Comment(
        username: username,
        comment: comment,
        datePublished: DateTime.now(),
        uid: uid,
      );
      await db
          .collection("videos")
          .doc(videoId)
          .collection("comment")
          .doc()
          .set(userComment.toJson());
      await db.collection("videos").doc(videoId).update({
        'commentCount': FieldValue.increment(1),
      });
    } catch (e) {
      throw Exception("Failed to post comment: $e");
    }
  }

  Future<void> getComments(String videoId) async {
    try {
      final querySnapshot = await db
          .collection("videos")
          .doc(videoId)
          .collection("comment")
          .orderBy("datePublished", descending: false)
          .get();
      _comments.value =
          querySnapshot.docs.map((doc) => Comment.fromMap(doc.data())).toList();
    } catch (e) {
      Get.snackbar("Error", "Error fetching comments: ${e.toString()}");
      rethrow;
    }
  }

  Future<void> doubleTapLike(String videoId) async {
    await likeVideo(videoId);
    Get.snackbar("Info", "Video Liked");
  }
}
