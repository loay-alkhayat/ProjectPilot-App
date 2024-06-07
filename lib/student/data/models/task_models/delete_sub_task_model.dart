import 'package:projectpilot/student/domain/entities/task_entities/delete_sub_task_entity.dart';

class DeleteSubTaskModel extends DeleteSubTaskEntity {
  const DeleteSubTaskModel({required super.status, required super.message});

  factory DeleteSubTaskModel.fromJson(Map<String, dynamic> json) {
    return DeleteSubTaskModel(message: json['message'], status: json['status']);
  }
}
