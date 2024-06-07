class AddLikeParameters {
  final int postID;

  AddLikeParameters({required this.postID});

  @override
  toString() => "$postID/like";
}
