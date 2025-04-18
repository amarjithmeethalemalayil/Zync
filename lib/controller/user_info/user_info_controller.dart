import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zynk/core/constants/local_remote_helper/local_remote_helper.dart';
import 'package:zynk/service/local/local_data_service.dart';

class UserInfoController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  RxString username = 'Loading...'.obs;
    final LocalDataService localDataService = Get.find<LocalDataService>();

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

  void logOut(){
    localDataService.setBool(key: LocalRemoteHelper.loggedIn, value: false);
    auth.signOut();
  }
}

