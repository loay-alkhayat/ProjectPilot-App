import '../../../domain/entities/post_entities/get_posts_entity.dart';

class GetPostsModel extends GetPostsEntity {
  const GetPostsModel(
      {required super.status,
      required super.message,
      required super.pages,
      required super.posts});

  factory GetPostsModel.fromJson(Map<String, dynamic> json) {
    return GetPostsModel(
      status: json["status"],
      message: json["message"] ?? "",
      pages: json['pages'] ?? 0,
      posts: List<GetPostsDataModel>.from(
        json['data']['posts'].map((data) => GetPostsDataModel.fromJson(data)),
      ),
    );
  }
}

class GetPostsDataModel extends GetPostsDataEntity {
  const GetPostsDataModel(
      {required super.postID,
      required super.postCommentsCount,
      required super.post,
      required super.userType,
      required super.isLiked,
      required super.postLikesCount,
      required super.postStudentName});

  factory GetPostsDataModel.fromJson(Map<String, dynamic> json) {
    return GetPostsDataModel(
      postCommentsCount: json['commentCount'],
      postStudentName: json['user_name'],
      postLikesCount: json['likeCount'],
      isLiked: json['isLiked'],
      userType: json['user_type'],
      post: json['post'],
      postID: json['id'],
    );
  }
}
