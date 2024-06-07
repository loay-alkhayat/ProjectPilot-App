import 'package:equatable/equatable.dart';

class GetStudentByIdEntity extends Equatable {
  final String status;
  final int pages;
  final String message;

  final GetStudentByIdData data;

  const GetStudentByIdEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class GetStudentByIdData extends Equatable {
  final String userType;
  final String name;
  final String universityIdNumber;
  final String bio;
  final String major;
  final int junior;
  final bool isLeader;
  final int teamID;
  final int studentID;

  const GetStudentByIdData(
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
