import '../../../domain/entities/team_entities/get_team_by_id_entity.dart';

class GetTeamByIdModel extends GetTeamByIdEntity {
  GetTeamByIdModel(
      {required status, required pages, required data, required message})
      : super(status: status, pages: pages, data: data, message: message);

  factory GetTeamByIdModel.fromJson(Map<String, dynamic> json) {
    return GetTeamByIdModel(
      status: json["status"] ?? "",
      pages: json['pages'] ?? 0,
      data: GetTeamByIdDataModel.fromJson(json['data']),
      message: json['message'] ?? "",
    );
  }
}

class GetTeamByIdDataModel extends GetTeamByIdData {
  GetTeamByIdDataModel(
      {required engineer,
      required teamID,
      required supervisor,
      required proposal,
      required teamStudents,
      required teamLeader})
      : super(
          teamID: teamID,
          teamStudents: teamStudents,
          teamLeader: teamLeader,
          supervisor: supervisor,
          engineer: engineer,
          proposal: proposal,
        );

  factory GetTeamByIdDataModel.fromJson(Map<String, dynamic> json) {
    return GetTeamByIdDataModel(
      engineer: json['engineer'],
      proposal: json['proposal'] ?? "",
      supervisor: json['superVisor'],
      teamID: json['id'],
      teamLeader: TeamLeaderInfo.fromjson(json['leader']),
      teamStudents: List<TeamStudentsInfo>.from(
        json['students'].map((data) => TeamStudentsInfo.fromjson(data)),
      ),
    );
  }
}

class TeamLeaderInfo extends TeamLeader {
  TeamLeaderInfo(
      {required userType,
      required name,
      required bio,
      required major,
      required universityIdNumber,
      required junior,
      required studentID,
      required teamID,
      required isLeader})
      : super(
          teamID: teamID,
          studentID: studentID,
          isLeader: isLeader,
          major: major,
          universityIdNumber: universityIdNumber,
          userType: userType,
          name: name,
          bio: bio,
          junior: junior,
        );

  factory TeamLeaderInfo.fromjson(Map<String, dynamic> json) {
    return TeamLeaderInfo(
      major: json['major'],
      isLeader: json['is_leader'],
      studentID: json['id'],
      userType: json['user_type'],
      name: json['name'] ?? "",
      teamID: json['has_team'],
      universityIdNumber: json['University_id_number'],
      junior: json['junior'],
      bio: json['bio'] ?? "",
    );
  }
}

class TeamStudentsInfo extends TeamStudents {
  TeamStudentsInfo(
      {required userType,
      required name,
      required bio,
      required major,
      required universityIdNumber,
      required junior,
      required studentID,
      required teamID,
      required isLeader})
      : super(
          teamID: teamID,
          studentID: studentID,
          isLeader: isLeader,
          major: major,
          universityIdNumber: universityIdNumber,
          userType: userType,
          name: name,
          bio: bio,
          junior: junior,
        );

  factory TeamStudentsInfo.fromjson(Map<String, dynamic> json) {
    return TeamStudentsInfo(
      major: json['major'],
      isLeader: json['is_leader'],
      studentID: json['id'],
      userType: json['user_type'],
      name: json['name'] ?? "",
      teamID: json['has_team'],
      universityIdNumber: json['University_id_number'],
      junior: json['junior'],
      bio: json['bio'] ?? "",
    );
  }
}
