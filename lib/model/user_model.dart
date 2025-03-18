class UserModel {
  final String name;
  final String email;
  final String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "uid": uid,
      };

  static UserModel fromJson(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'],
      email: data['email'],
      uid: data['uid'],
    );
  }
}
