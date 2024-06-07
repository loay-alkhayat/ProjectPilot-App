import 'package:equatable/equatable.dart';

class GetTaskByIdEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final GetTaskByIdDetails data;

  const GetTaskByIdEntity(
      {required this.status,
      required this.data,
      required this.pages,
      required this.message});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class GetTaskByIdDetails extends Equatable {
  final String description;
  final String title;
  final int progress;
  final int taskID;
  final int daysLeft;
  final List<TaskByIdStudents> taskStudents;
  final List<SubTasksOfTaskById> subTasks;

  const GetTaskByIdDetails({
    required this.description,
    required this.subTasks,
    required this.daysLeft,
    required this.title,
    required this.progress,
    required this.taskID,
    required this.taskStudents,
  });

  @override
  List<Object?> get props =>
      [progress, title, description, taskID, subTasks, daysLeft, taskStudents];
}

class TaskByIdStudents extends Equatable {
  final String userType;
  final String name;
  final String universityIdNumber;
  final String bio;
  final String major;
  final int junior;
  final int teamID;
  final bool isLeader;
  final int studentID;

  const TaskByIdStudents(
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

class SubTasksOfTaskById extends Equatable {
  final String subTaskDescription;
  final String subTaskTitle;
  final int subTaskDaysLeft;
  final SubTaskStudent subTaskStudent;
  final int subTaskCompleted;
  final int subTaskID;

  const SubTasksOfTaskById(
      {required this.subTaskDescription,
      required this.subTaskTitle,
      required this.subTaskDaysLeft,
      required this.subTaskStudent,
      required this.subTaskCompleted,
      required this.subTaskID});

  @override
  List<Object?> get props => [
        subTaskDescription,
        subTaskTitle,
        subTaskDaysLeft,
        subTaskStudent,
        subTaskCompleted,
        subTaskID,
      ];
}

class SubTaskStudent extends Equatable {
  final int studentID;
  final String studentName;
  final String studentBio;
  final String studentMajor;

  const SubTaskStudent({
    required this.studentID,
    required this.studentName,
    required this.studentBio,
    required this.studentMajor,
  });

  @override
  List<Object?> get props => [
        studentID,
        studentName,
        studentMajor,
        studentBio,
      ];
}
