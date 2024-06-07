class AddCommentParameters {
  final String comment;
  final int postID;

  AddCommentParameters({required this.comment, required this.postID});

  Map<String, dynamic> toJson() => {'comment': comment};
}
