import '../../../domain/entities/blogs_entity/get_blogs_entity.dart';

class GetBlogsModel extends GetBlogsEntity {
  const GetBlogsModel(
      {required super.status,
      required super.message,
      required super.pages,
      required super.data});

  factory GetBlogsModel.fromJson(Map<String, dynamic> json) {
    return GetBlogsModel(
      status: json["status"],
      message: json["message"] ?? "",
      pages: json['pages'] ?? 0,
      data: GetBlogsDataModel.fromJson(json['data']),
    );
  }
}

class GetBlogsDataModel extends GetBlogsData {
  const GetBlogsDataModel({required super.blogs});

  factory GetBlogsDataModel.fromJson(Map<String, dynamic> json) {
    return GetBlogsDataModel(
      blogs: List<GetBlogs>.from(
        json['announcements'].map((data) => GetBlogs.fromJson(data)),
      ),
    );
  }
}

class GetBlogs extends Blogs {
  const GetBlogs(
      {required super.id,
      required super.title,
      required super.content,
      required super.date});

  factory GetBlogs.fromJson(Map<String, dynamic> json) {
    return GetBlogs(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        date: json['created_at']);
  }
}
