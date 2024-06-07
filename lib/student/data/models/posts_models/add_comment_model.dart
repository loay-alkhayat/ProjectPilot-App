import '../../../domain/entities/post_entities/add_comment_entity.dart';

class AddCommentOrLikeModel extends PostMethodResponsePostsScreensEntity {
  const AddCommentOrLikeModel(
      {required super.status, required super.message, required super.pages});

  factory AddCommentOrLikeModel.fromJson(Map<String, dynamic> json) {
    return AddCommentOrLikeModel(
      status: json["status"] ?? "",
      pages: json['pages'] ?? 0,
      message: json['message'] ?? "",
    );
  }
}
