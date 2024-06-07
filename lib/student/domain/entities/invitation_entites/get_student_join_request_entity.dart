import 'package:equatable/equatable.dart';

class GetStudentJoinRequestEntity extends Equatable {
  final String status;
  final int pages;
  final String message;
  final List<GetStudentJoinRequestData> data;

  const GetStudentJoinRequestEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class GetStudentJoinRequestData extends Equatable {
  final int requestID;
  final GetTeamDataOfStudentJoinRequest teamData;

  const GetStudentJoinRequestData(
      {required this.requestID, required this.teamData});

  @override
  List<Object?> get props => [requestID, teamData];
}

class GetTeamDataOfStudentJoinRequest extends Equatable {
  final int teamID;
  final String teamName;
  final GetTeamLeaderDataOfStudentJoinRequest teamLeaderInfo;

  const GetTeamDataOfStudentJoinRequest({
    required this.teamID,
    required this.teamName,
    required this.teamLeaderInfo,
  });

  @override
  List<Object?> get props => [teamID, teamLeaderInfo, teamName];
}

class GetTeamLeaderDataOfStudentJoinRequest extends Equatable {
  final String leaderName;
  final String leaderMajor;

  const GetTeamLeaderDataOfStudentJoinRequest({
    required this.leaderName,
    required this.leaderMajor,
  });

  @override
  List<Object?> get props => [leaderMajor, leaderName];
}
