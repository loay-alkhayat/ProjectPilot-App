import 'package:equatable/equatable.dart';

class GetTasksEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final List<GetTaskDetails> data;

  const GetTasksEntity(
      {required this.status,
      required this.data,
      required this.pages,
      required this.message});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class GetTaskDetails extends Equatable {
  final String description;
  final String title;
  final int progress;
  final int taskID;
  final List<TaskStudents> taskStudents;

  const GetTaskDetails({
    required this.description,
    required this.title,
    required this.progress,
    required this.taskID,
    required this.taskStudents,
  });

  @override
  List<Object?> get props =>
      [progress, title, description, taskID, taskStudents];
}

class TaskStudents extends Equatable {
  final String userType;
  final String name;
  final String universityIdNumber;
  final String bio;
  final String major;
  final int junior;
  final int teamID;
  final bool isLeader;
  final int studentID;

  const TaskStudents(
      {required this.userType,
      required this.name,
      required this.universityIdNumber,
      required this.bio,
      required this.major,
      required this.junior,
      required this.isLeader,
      required this.teamID,
      required this.studentID});

  @override
  List<Object?> get props => [
        userType,
        name,
        universityIdNumber,
        bio,
        major,
        junior,
        teamID,
        isLeader,
        studentID
      ];
}
