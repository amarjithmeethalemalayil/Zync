import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';
import 'package:zynk/core/constants/local_remote_helper/local_remote_helper.dart';
import 'package:zynk/core/routes/app_routes.dart';
import 'package:zynk/model/video_model.dart';
import 'package:zynk/view/create_one/widgets/show_error_snack_bar.dart';
import 'package:zynk/view/create_one/widgets/show_video_upload_loading.dart';

class MediaController extends GetxController {
  final FirebaseFirestore db;
  final FirebaseAuth auth;
  final SupabaseClient client;

  MediaController({
    required this.db,
    required this.auth,
    required this.client,
  });

  var videoFile = Rx<File?>(null);
  var videoPath = RxString('');
  var videoController = Rx<VideoPlayerController?>(null);

  Future<File?> pickVideo(ImageSource source) async {
    try {
      final video = await ImagePicker().pickVideo(source: source);
      if (video != null) {
        videoFile.value = File(video.path);
        videoPath.value = video.path;
        return videoFile.value;
      }
    } catch (e) {
      ShowErrorSnackBar.showErrorSnackbar(
          "Something went wrong while picking the video");
    }
    return null;
  }

  Future<File?> _getThumbnail(String videoPath) async {
    return await VideoCompress.getFileThumbnail(videoPath);
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    File? thumbnailFile = await _getThumbnail(videoPath);
    if (thumbnailFile == null) {
      ShowErrorSnackBar.showErrorSnackbar("Thumbnail generation failed");
      throw Exception("Thumbnail generation failed");
    }
    final filePath = 'videos/thumbnail/$id.jpg';
    try {
      await client.storage.from('videos').upload(
            filePath,
            thumbnailFile,
            fileOptions: const FileOptions(upsert: true),
          );
      return client.storage.from('videos').getPublicUrl(filePath);
    } catch (e) {
      ShowErrorSnackBar.showErrorSnackbar("Upload failed: $e");
      throw Exception("Upload failed: $e");
    }
  }

  Future<String?> _uploadVideoToStorage(
      String videoId, String videoPath) async {
    try {
      final compressedVideo = await _compressVideo(videoPath);
      if (compressedVideo == null) return null;
      String filePath = 'videos/$videoId.mp4';
      await client.storage.from('videos').upload(
            filePath,
            compressedVideo,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
          );
      return client.storage.from('videos').getPublicUrl(filePath);
    } catch (e) {
      return null;
    }
  }

  Future<void> uploadVideo(
    String caption,
    String videoPath,
  ) async {
    try {
      ShowVideoUploadLoading.showLoadingDialog();
      String uid = auth.currentUser!.uid;
      final collection = db.collection(LocalRemoteHelper.collectionName);
      DocumentSnapshot userDoc = await collection.doc(uid).get();
      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
      String username = userData?['name'] ?? 'Unknown';
      var allVideoDocs = await db.collection('videos').get();
      int len = allVideoDocs.docs.length;
      String videoId = "Video $len";
      String? videoUrl = await _uploadVideoToStorage(videoId, videoPath);
      if (videoUrl == null) {
        Get.back();
        ShowErrorSnackBar.showErrorSnackbar("Video upload failed.");
        return;
      }
      String? thumbnailUrl = await _uploadImageToStorage(videoId, videoPath);
      if (thumbnailUrl.isEmpty) {
        Get.back();
        ShowErrorSnackBar.showErrorSnackbar("Thumbnail upload failed.");
        return;
      }
      Video video = Video(
        username: username,
        uid: uid,
        id: videoId,
        likes: [],
        commentCount: 0,
        caption: caption,
        videoUrl: videoUrl,
        thumbnail: thumbnailUrl,
      );
      await db.collection('videos').doc(videoId).set(video.toJson());
      await collection.doc(uid).update({
        'uploadedVideos': FieldValue.arrayUnion([videoId]),
      });
      Get.snackbar("Success", "Video uploaded successfully!");
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.back();
      ShowErrorSnackBar.showErrorSnackbar(
          "Error Uploading Video: ${e.toString()}");
    }
  }

  Future<File?> _compressVideo(String videoPath) async {
    try {
      final compressedVideo = await VideoCompress.compressVideo(
        videoPath,
        quality: VideoQuality.MediumQuality,
      );
      return compressedVideo?.file;
    } catch (e) {
      return null;
    }
  }

  void initializeVideo() {
    if (videoFile.value != null) {
      videoController.value = VideoPlayerController.file(videoFile.value!)
        ..initialize().then((_) {
          videoController.value!
            ..play()
            ..setVolume(1)
            ..setLooping(true);
        });
    }
  }

  void clearVideo() {
    videoFile.value = null;
    videoPath.value = '';
    videoController.value?.dispose();
    videoController.value = null;
  }
}
