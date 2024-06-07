import 'package:equatable/equatable.dart';

class GetStudentsEntity extends Equatable {
  final String status;
  final int pages;
  final String message;

  final GetStudentsData data;

  const GetStudentsEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class GetStudentsData extends Equatable {
  final List<GetStudents> student;

  const GetStudentsData({required this.student});

  @override
  List<Object?> get props => [student];
}

class GetStudents extends Equatable {
  final String userType;
  final String name;
  final String universityIdNumber;
  final String bio;
  final String major;
  final int junior;
  final bool isLeader;
  final int teamID;
  final int studentID;

  GetStudents(
      {required this.userType,
      required this.name,
      required this.universityIdNumber,
      required this.bio,
      required this.isLeader,
      required this.teamID,
      required this.major,
      required this.junior,
      required this.studentID});

  @override
  List<Object?> get props => [
        userType,
        name,
        universityIdNumber,
        bio,
        major,
        junior,
        isLeader,
        teamID,
        studentID
      ];
}
