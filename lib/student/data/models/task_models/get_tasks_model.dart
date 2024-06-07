import '../../../domain/entities/task_entities/get_tasks_entity.dart';

class GetTasksModel extends GetTasksEntity {
  GetTasksModel({
    required status,
    required pages,
    required data,
    required message,
  }) : super(
          message: message,
          status: status,
          pages: pages,
          data: data,
        );

  factory GetTasksModel.fromJson(Map<String, dynamic> json) {
    return GetTasksModel(
      status: json["status"],
      message: json["message"] ?? "",
      pages: json['pages'] ?? 0,
      data: List<TaskDetails>.from(
        json['data'].map((data) => TaskDetails.fromjson(data)),
      ),
    );
  }
}

class TaskDetails extends GetTaskDetails {
  TaskDetails({
    required description,
    required progress,
    required taskID,
    required taskStudents,
    required title,
  }) : super(
            description: description,
            progress: progress,
            taskID: taskID,
            taskStudents: taskStudents,
            title: title);

  factory TaskDetails.fromjson(Map<String, dynamic> json) {
    return TaskDetails(
      taskStudents: List<GetTasksStudents>.from(
        json['students'].map((data) => GetTasksStudents.fromjson(data)),
      ),
      description: json['description'],
      progress: json['progress'],
      title: json['title'],
      taskID: json['id'],
    );
  }
}

class GetTasksStudents extends TaskStudents {
  GetTasksStudents(
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

  factory GetTasksStudents.fromjson(Map<String, dynamic> json) {
    return GetTasksStudents(
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
