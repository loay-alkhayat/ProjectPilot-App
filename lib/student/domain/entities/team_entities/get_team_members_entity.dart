import 'package:equatable/equatable.dart';

class GetTeamMembersEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final List<GetTeamMembersData> data;

  const GetTeamMembersEntity(
      {required this.status,
      required this.data,
      required this.pages,
      required this.message});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class GetTeamMembersData extends Equatable {
  final String universityIdNumber;
  final String bio;
  final String name;
  final int junior;
  final String major;
  final int teamID;
  final int studentID;

  const GetTeamMembersData(
      {required this.universityIdNumber,
      required this.bio,
      required this.major,
      required this.junior,
      required this.teamID,
      required this.name,
      required this.studentID});

  @override
  List<Object?> get props =>
      [universityIdNumber, bio, major, junior, teamID, name, studentID];
}
