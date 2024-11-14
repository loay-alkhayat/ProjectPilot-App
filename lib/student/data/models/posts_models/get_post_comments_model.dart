import '../../../domain/entities/post_entities/get_post_comments_entity.dart';

class GetPostCommentsModel extends GetPostCommentsEntity {
  const GetPostCommentsModel(
      {required super.status,
      required super.message,
      required super.pages,
      required super.comments});

  factory GetPostCommentsModel.fromJson(Map<String, dynamic> json) {
    return GetPostCommentsModel(
      status: json["status"],
      message: json["message"] ?? "",
      pages: json['pages'] ?? 0,
      comments: List<GetPostCommentsDataModel>.from(
        json['data']['comments']
            .map((data) => GetPostCommentsDataModel.fromJson(data)),
      ),
    );
  }
}

class GetPostCommentsDataModel extends GetPostCommentsDataEntity {
  const GetPostCommentsDataModel(
      {required super.commentID,
      required super.comment,
      required super.commentStudentName,
      required super.userType,
      required super.commentDate,
      required super.commentStudentID});

  factory GetPostCommentsDataModel.fromJson(Map<String, dynamic> json) {
    return GetPostCommentsDataModel(
      commentID: json['comment_id'],
      comment: json['comment'],
      commentDate: json['created_at'],
      commentStudentID: json['user_id'],
      userType: json['user_type'],
      commentStudentName: json['user_name'],
    );
  }
}
