import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zynk/model/searched_user_model.dart'; 

class MySearchController extends GetxController {
  final FirebaseAuth auth;
  final FirebaseFirestore db;

  MySearchController(this.auth, this.db);

  final Rx<List<SearchedUserModel>> _searchedUsers =
      Rx<List<SearchedUserModel>>([]);
  List<SearchedUserModel> get searchedUsers => _searchedUsers.value;

  Future<void> searchUser(String input) async {
    if (input.isEmpty) {
      _searchedUsers.value = [];
      return;
    }

    final currentUserUid = auth.currentUser?.uid;

    final snapshot = await db
        .collection("accounts")
        .where('name', isGreaterThanOrEqualTo: input)
        .get();

    final List<SearchedUserModel> temp = snapshot.docs
        .map((doc) {
          return SearchedUserModel.fromMap(doc.data());
        })
        .where((user) => user.uid != currentUserUid)
        .toList();
    _searchedUsers.value = temp;
  }
}
