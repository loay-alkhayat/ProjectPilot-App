import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final StudentData data;

  const StudentEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, message, data, pages];
}

class StudentData extends Equatable {
  final Student user;
  final String barrertoken;

  const StudentData({required this.user, required this.barrertoken});

  @override
  List<Object?> get props => [user, barrertoken];
}

class Student extends Equatable {
  final String userType;
  final String name;
  final String universityIdNumber;
  final String bio;
  final String major;
  final int junior;
  final int teamID;
  final bool isLeader;
  final bool userID;

  Student(
      {required this.userType,
      required this.name,
      required this.universityIdNumber,
      required this.bio,
      required this.major,
      required this.junior,
      required this.isLeader,
      required this.teamID,
      required this.userID});

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
        userID
      ];
}
