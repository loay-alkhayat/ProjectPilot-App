import 'package:equatable/equatable.dart';

class CreateTeamEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final CreateTeamData data;

  const CreateTeamEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, message, data, pages];
}

class CreateTeamData extends Equatable {
  final int id;
  final LeaderData leader;
  final String proposal;
  final String supervisor;
  final String engineer;

  const CreateTeamData(
      {required this.leader,
      required this.id,
      required this.engineer,
      required this.proposal,
      required this.supervisor});

  @override
  List<Object?> get props => [id, leader];
}

class LeaderData extends Equatable {
  final String userType;
  final String name;
  final String leaderUnivercityIdNumber;
  final String bio;
  final String speciality;
  final int junior;

  LeaderData(
      {required this.userType,
      required this.name,
      required this.leaderUnivercityIdNumber,
      required this.bio,
      required this.speciality,
      required this.junior});

  @override
  List<Object?> get props =>
      [userType, name, leaderUnivercityIdNumber, bio, speciality, junior];
}
