// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:zynk/core/constants/local_remote_helper/local_remote_helper.dart';

// class UserInfoController extends GetxController {
//   final FirebaseAuth auth;
//   final FirebaseFirestore db;

//   UserInfoController({
//     required this.auth,
//     required this.db,
//   });
//   Future<String> findUserName() async {
//     try {
//       final uid = auth.currentUser!.uid;
//       final collectionDoc = db.collection(LocalRemoteHelper.collectionName);
//       DocumentSnapshot userDoc = await collectionDoc.doc(uid).get();
//       Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
//       String username = userData?['name'] ?? 'Unknown';
//       return username;
//     } catch (e) {
//       print("error");
//       return 'Unknown';
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zynk/core/constants/local_remote_helper/local_remote_helper.dart';

class UserInfoController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  RxString username = 'Loading...'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    try {
      final uid = auth.currentUser?.uid;
      if (uid == null) {
        username.value = 'Unknown';
        return;
      }

      final collectionDoc = db.collection(LocalRemoteHelper.collectionName);
      DocumentSnapshot userDoc = await collectionDoc.doc(uid).get();
      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

      username.value = userData?['name'] ?? 'Unknown';
    } catch (e) {
      username.value = 'Unknown';
      print("Error fetching user name: $e");
    }
  }
}

