import 'package:projectpilot/student/domain/entities/team_entities/create_team_entity.dart';

class CreateTeamModel extends CreateTeamEntity {
  CreateTeamModel(
      {required status, required pages, required data, required message})
      : super(status: status, pages: pages, data: data, message: message);

  factory CreateTeamModel.fromJson(Map<String, dynamic> json) {
    return CreateTeamModel(
      status: json["status"] ?? "",
      pages: json['pages'] ?? 0,
      data: CreateTeamDataModel.fromJson(json['data']),
      message: json['message'] ?? "",
    );
  }
}

class CreateTeamDataModel extends CreateTeamData {
  CreateTeamDataModel(
      {required engineer,
      required id,
      required leader,
      required proposal,
      required supervisor})
      : super(
          engineer: engineer,
          id: id,
          leader: leader,
          proposal: proposal,
          supervisor: supervisor,
        );

  factory CreateTeamDataModel.fromJson(Map<String, dynamic> json) {
    return CreateTeamDataModel(
      engineer: json['engineer'] ?? "",
      proposal: json['proposal'] ?? "",
      supervisor: json['superVisor'] ?? "",
      id: json['id'],
      leader: TeamLEaderInfo.fromjson(json['leader']),
    );
  }
}

class TeamLEaderInfo extends LeaderData {
  TeamLEaderInfo(
      {required userType,
      required name,
      required bio,
      required junior,
      required leaderUnivercityIdNumber,
      required speciality})
      : super(
            userType: userType,
            name: name,
            bio: bio,
            junior: junior,
            leaderUnivercityIdNumber: leaderUnivercityIdNumber,
            speciality: speciality);

  factory TeamLEaderInfo.fromjson(Map<String, dynamic> json) {
    return TeamLEaderInfo(
      userType: json['user_type'],
      name: json['name'] ?? "",
      speciality: json['major'],
      leaderUnivercityIdNumber: json['University_id_number'],
      junior: json['junior'],
      bio: json['bio'] ?? "",
    );
  }
}
