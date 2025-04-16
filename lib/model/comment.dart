class Comment {
  final String username;
  final String comment;
  final DateTime datePublished;
  final String uid;

  Comment({
    required this.username,
    required this.comment,
    required this.datePublished,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'comment': comment,
        'datePublished': datePublished,
        'uid': uid,

      };

factory Comment.fromMap(Map<String, dynamic> map) {
  return Comment(
    username: map['username'],
    comment: map['comment'],
    datePublished: map['datePublished'].toDate(),
    uid: map['uid'],
  );
}
}