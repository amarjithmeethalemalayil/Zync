class SearchedUserModel {
  final String uid;
  final String name;

  SearchedUserModel({
    required this.uid,
    required this.name,
  });

  factory SearchedUserModel.fromMap(Map<String, dynamic> map) {
    return SearchedUserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
