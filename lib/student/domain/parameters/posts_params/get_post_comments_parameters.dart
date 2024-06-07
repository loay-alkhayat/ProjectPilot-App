class GetPostCommentsParameters {
  final int postID;

  GetPostCommentsParameters({required this.postID});

  @override
  toString() => "$postID/comments";
}
