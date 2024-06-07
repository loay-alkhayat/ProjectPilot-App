class CreatePostParameters {
  final String postDescription;

  CreatePostParameters({required this.postDescription});

  Map<String, dynamic> toJson() => {'post': postDescription};
}
