import 'package:projectpilot/student/domain/entities/task_entities/creat_task_entity.dart';

class CreateTaskModel extends CreateTaskEntity {
  CreateTaskModel(
      {required status, required pages, required data, required message})
      : super(status: status, pages: pages, data: data, message: message);

  factory CreateTaskModel.fromJson(Map<String, dynamic> json) {
    return CreateTaskModel(
      status: json["status"] ?? "",
      pages: json['pages'] ?? 0,
      data: CreateTaskDataModel.fromjson(json['data']),
      message: json['message'] ?? "",
    );
  }
}

class CreateTaskDataModel extends CreateTasktData {
  CreateTaskDataModel({
    required id,
    required title,
    required description,
    required progress,
  }) : super(
          id: id,
          description: description,
          progress: progress,
          title: title,
        );

  factory CreateTaskDataModel.fromjson(Map<String, dynamic> json) {
    return CreateTaskDataModel(
      title: json['title'],
      progress: json['progress'] ?? "",
      description: json['description'],
      id: json['id'],
    );
  }
}
