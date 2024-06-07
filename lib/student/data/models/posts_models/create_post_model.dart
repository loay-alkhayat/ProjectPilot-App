import 'package:projectpilot/student/domain/entities/Post_entities/creat_Post_entity.dart';

class CreatePostModel extends CreatePostEntity {
  const CreatePostModel({required status, required pages, required message})
      : super(status: status, pages: pages, message: message);

  factory CreatePostModel.fromJson(Map<String, dynamic> json) {
    return CreatePostModel(
      status: json["status"] ?? "",
      pages: json['pages'] ?? 0,
      message: json['message'] ?? "",
    );
  }
}
