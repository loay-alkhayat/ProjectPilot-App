import 'package:equatable/equatable.dart';

class GetTeamsEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final List<GetTeamDetails> data;

  const GetTeamsEntity(
      {required this.status,
      required this.data,
      required this.pages,
      required this.message});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class GetTeamDetails extends Equatable {
  final String teamName;

  final int teamID;

  const GetTeamDetails({
    required this.teamID,
    required this.teamName,
  });

  @override
  List<Object?> get props => [teamName, teamID];
}
