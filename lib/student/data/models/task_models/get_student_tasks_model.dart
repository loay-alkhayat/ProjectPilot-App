import '../../../domain/entities/task_entities/get_student_tasks_entity.dart';

class GetStudentTasksModel extends GetStudentTasksEntity {
  const GetStudentTasksModel(
      {required super.status,
      required super.pages,
      required super.data,
      required super.message});

  factory GetStudentTasksModel.fromJson(Map<String, dynamic> json) {
    return GetStudentTasksModel(
      status: json["status"],
      message: json["message"] ?? "",
      pages: json['pages'] ?? 0,
      data: List<GetStudentTasksDataModel>.from(
        json['data'].map((data) => GetStudentTasksDataModel.fromJson(data)),
      ),
    );
  }
}

class GetStudentTasksDataModel extends GetStudentTaskskData {
  const GetStudentTasksDataModel(
      {required super.studentTasks, required super.mainTaskTitle});

  factory GetStudentTasksDataModel.fromJson(Map<String, dynamic> json) {
    return GetStudentTasksDataModel(
      mainTaskTitle: json['title'],
      studentTasks: List<GetStudentTasksDetailsModel>.from(
        json['subTasks']
            .map((data) => GetStudentTasksDetailsModel.fromjson(data)),
      ),
    );
  }
}

class GetStudentTasksDetailsModel extends GetStudentTasksDetails {
  const GetStudentTasksDetailsModel(
      {required super.description,
      required super.title,
      required super.progress,
      required super.taskID,
      required super.daysLeft});

  factory GetStudentTasksDetailsModel.fromjson(Map<String, dynamic> json) {
    return GetStudentTasksDetailsModel(
      daysLeft: json['days_left'],
      description: json['description'],
      progress: json['completed'],
      title: json['title'],
      taskID: json['id'],
    );
  }
}
