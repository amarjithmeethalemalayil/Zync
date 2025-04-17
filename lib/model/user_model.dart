class UserModel {
  final String name;
  final String email;
  final String uid;
  final List followers;
  final List following;
  final List uploadedVideos;

  UserModel({
    required this.name,
    required this.email,
    required this.uid,
    required this.followers,
    required this.following,
    required this.uploadedVideos,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "uid": uid,
        "followers": followers,
        "following": following,
        "uploadedVideos": uploadedVideos,
      };

  static UserModel fromJson(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'],
      email: data['email'],
      uid: data['uid'],
      followers: data['followers'],
      following: data['following'],
      uploadedVideos: data['uploadedVideos'],
    );
  }
}
