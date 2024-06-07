import 'package:equatable/equatable.dart';

class GetTeamJoinRequestEntity extends Equatable {
  final String status;
  final int pages;
  final String message;
  final List<GetTeamJoinRequestData> data;

  const GetTeamJoinRequestEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class GetTeamJoinRequestData extends Equatable {
  final int requestID;
  final GetTeamJoinRequestStudentData studentData;

  const GetTeamJoinRequestData(
      {required this.requestID, required this.studentData});

  @override
  List<Object?> get props => [requestID, studentData];
}

class GetTeamJoinRequestStudentData extends Equatable {
  final int studentId;
  final String uniNumber;
  final String major;
  final String bio;
  final String studentName;

  const GetTeamJoinRequestStudentData(
      {required this.studentId,
      required this.uniNumber,
      required this.studentName,
      required this.bio,
      required this.major});

  @override
  List<Object?> get props => [studentId, studentName, uniNumber, major, bio];
}
