import '../../../domain/entities/task_entities/create_sub_task_entity.dart';

class CreateSubTaskModel extends CreateSubTaskEntity {
  CreateSubTaskModel(
      {required status, required pages, required data, required message})
      : super(status: status, pages: pages, data: data, message: message);

  factory CreateSubTaskModel.fromJson(Map<String, dynamic> json) {
    return CreateSubTaskModel(
      status: json["status"] ?? "",
      pages: json['pages'] ?? 0,
      data: CreateSubTaskDataModel.fromjson(json['data']),
      message: json['message'] ?? "",
    );
  }
}

class CreateSubTaskDataModel extends CreateSubTasktData {
  CreateSubTaskDataModel({
    required id,
    required title,
    required description,
    required completed,
  }) : super(
          id: id,
          description: description,
          completed: completed,
          title: title,
        );

  factory CreateSubTaskDataModel.fromjson(Map<String, dynamic> json) {
    return CreateSubTaskDataModel(
      title: json['title'],
      completed: json['completed'] ?? "",
      description: json['description'],
      id: json['id'],
    );
  }
}
