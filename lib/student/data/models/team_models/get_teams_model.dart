import '../../../domain/entities/team_entities/get_teams_entity.dart';

class GetTeamsModel extends GetTeamsEntity {
  const GetTeamsModel(
      {required status, required pages, required data, required message})
      : super(status: status, pages: pages, data: data, message: message);

  factory GetTeamsModel.fromJson(Map<String, dynamic> json) {
    return GetTeamsModel(
      status: json["status"] ?? "",
      pages: json['pages'] ?? 0,
      data: List<GetTeamsDataModel>.from(
        json['data']['team'].map((data) => GetTeamsDataModel.fromJson(data)),
      ),
      message: json['message'] ?? "",
    );
  }
}

class GetTeamsDataModel extends GetTeamDetails {
  const GetTeamsDataModel({
    required teamID,
    required teamName,
  }) : super(teamID: teamID, teamName: teamName);

  factory GetTeamsDataModel.fromJson(Map<String, dynamic> json) {
    return GetTeamsDataModel(teamID: json['id'], teamName: json['name']);
  }
}
