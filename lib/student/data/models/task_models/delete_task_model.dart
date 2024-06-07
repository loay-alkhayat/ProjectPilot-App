import '../../../domain/entities/task_entities/delete_task_entity.dart';

class DeleteTaskModel extends DeleteTaskEntity {
  DeleteTaskModel({required status, required message})
      : super(status: status, message: message);

  factory DeleteTaskModel.fromJson(Map<String, dynamic> json) {
    return DeleteTaskModel(
      status: json["status"] ?? "",
      message: json['message'] ?? "",
    );
  }
}
