import 'package:projectpilot/student/domain/entities/task_entities/complete_sub_task_entity.dart';

class CompleteSubTaskModel extends CompleteSubTaskEntity {
  const CompleteSubTaskModel({required super.id, required super.completed});

  factory CompleteSubTaskModel.fromJson(Map<String, dynamic> json) {
    return CompleteSubTaskModel(id: json['id'], completed: json['completed']);
  }
}
