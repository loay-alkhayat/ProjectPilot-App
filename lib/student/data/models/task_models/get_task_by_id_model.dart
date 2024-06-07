import '../../../domain/entities/task_entities/get_task_by_id_entity.dart';

class GetTaskByIdModel extends GetTaskByIdEntity {
  const GetTaskByIdModel(
      {required super.status,
      required super.data,
      required super.pages,
      required super.message});

  factory GetTaskByIdModel.fromJson(Map<String, dynamic> json) {
    return GetTaskByIdModel(
      status: json["status"],
      message: json["message"] ?? "",
      pages: json['pages'] ?? 0,
      data: TaskDetailsModel.fromjson(json['data']),
    );
  }
}

class TaskDetailsModel extends GetTaskByIdDetails {
  const TaskDetailsModel(
      {required super.description,
      required super.subTasks,
      required super.daysLeft,
      required super.title,
      required super.progress,
      required super.taskID,
      required super.taskStudents});

  factory TaskDetailsModel.fromjson(Map<String, dynamic> json) {
    return TaskDetailsModel(
      daysLeft: json['days_left'],
      subTasks: List<GetTaskByIdSubTasks>.from(
        json['subTasks'].map(
          (data) => GetTaskByIdSubTasks.fromjson(data),
        ),
      ),
      taskStudents: List<GetTaskByIdStudents>.from(
        json['students'].map(
          (data) => GetTaskByIdStudents.fromjson(data),
        ),
      ),
      description: json['description'],
      progress: json['progress'],
      title: json['title'],
      taskID: json['id'],
    );
  }
}

class GetTaskByIdStudents extends TaskByIdStudents {
  const GetTaskByIdStudents(
      {required userType,
      required name,
      required universityIdNumber,
      required bio,
      required major,
      required junior,
      required hasTeam,
      required isLeader,
      required studentID})
      : super(
          studentID: studentID,
          isLeader: isLeader,
          teamID: hasTeam,
          bio: bio,
          junior: junior,
          name: name,
          userType: userType,
          major: major,
          universityIdNumber: universityIdNumber,
        );

  factory GetTaskByIdStudents.fromjson(Map<String, dynamic> json) {
    return GetTaskByIdStudents(
        studentID: json['id'],
        hasTeam: json['has_team'],
        isLeader: json['is_leader'],
        userType: json['user_type'],
        name: json['name'] ?? "",
        universityIdNumber: json['University_id_number'],
        bio: json['bio'] ?? "",
        major: json['major'],
        junior: json['junior']);
  }
}

class GetTaskByIdSubTasks extends SubTasksOfTaskById {
  const GetTaskByIdSubTasks(
      {required super.subTaskDescription,
      required super.subTaskTitle,
      required super.subTaskDaysLeft,
      required super.subTaskStudent,
      required super.subTaskCompleted,
      required super.subTaskID});

  factory GetTaskByIdSubTasks.fromjson(Map<String, dynamic> json) {
    return GetTaskByIdSubTasks(
        subTaskID: json['id'],
        subTaskCompleted: json['completed'],
        subTaskDaysLeft: json['days_left'],
        subTaskDescription: json['description'],
        subTaskStudent: GetTaskByIdSubTaskStudent.fromjson(json['student']),
        subTaskTitle: json['title']);
  }
}

class GetTaskByIdSubTaskStudent extends SubTaskStudent {
  const GetTaskByIdSubTaskStudent(
      {required super.studentID,
      required super.studentName,
      required super.studentBio,
      required super.studentMajor});

  factory GetTaskByIdSubTaskStudent.fromjson(Map<String, dynamic> json) {
    return GetTaskByIdSubTaskStudent(
        studentName: json['name'],
        studentID: json['id'],
        studentBio: json['bio'] ?? "",
        studentMajor: json['major'] ?? "");
  }
}
