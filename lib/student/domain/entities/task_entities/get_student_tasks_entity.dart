import 'package:equatable/equatable.dart';

class GetStudentTasksEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final List<GetStudentTaskskData> data;

  const GetStudentTasksEntity(
      {required this.status,
      required this.pages,
      required this.data,
      required this.message});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class GetStudentTaskskData extends Equatable {
  final List<GetStudentTasksDetails> studentTasks;
  final String mainTaskTitle;

  const GetStudentTaskskData({
    required this.studentTasks,
    required this.mainTaskTitle,
  });

  @override
  List<Object?> get props => [studentTasks, mainTaskTitle];
}

class GetStudentTasksDetails extends Equatable {
  final String description;
  final String title;
  final String estimatedTime;
  final int daysLeft;
  final int progress;
  final int taskID;

  const GetStudentTasksDetails({
    required this.description,
    required this.estimatedTime,
    required this.title,
    required this.progress,
    required this.taskID,
    required this.daysLeft,
  });

  @override
  List<Object?> get props =>
      [progress, title, estimatedTime, description, taskID, daysLeft];
}
