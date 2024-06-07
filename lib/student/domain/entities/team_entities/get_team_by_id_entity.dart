import 'package:equatable/equatable.dart';

class GetTeamByIdEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final GetTeamByIdData data;

  const GetTeamByIdEntity(
      {required this.status,
      required this.data,
      required this.pages,
      required this.message});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class GetTeamByIdData extends Equatable {
  final String proposal;
  final String? supervisor;
  final String? engineer;
  final int teamID;
  final List<TeamStudents> teamStudents;
  final TeamLeader teamLeader;

  const GetTeamByIdData({
    required this.proposal,
    required this.supervisor,
    required this.engineer,
    required this.teamID,
    required this.teamStudents,
    required this.teamLeader,
  });

  @override
  List<Object?> get props =>
      [proposal, supervisor, engineer, teamID, teamLeader, teamStudents];
}

class TeamStudents extends Equatable {
  final String userType;
  final String name;
  final String universityIdNumber;
  final String bio;
  final String major;
  final int junior;
  final int teamID;
  final bool isLeader;
  final int studentID;

  const TeamStudents(
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

class TeamLeader extends Equatable {
  final String userType;
  final String name;
  final String universityIdNumber;
  final String bio;
  final String major;
  final int junior;
  final int teamID;
  final bool isLeader;
  final int studentID;

  const TeamLeader(
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
