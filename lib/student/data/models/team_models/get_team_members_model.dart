import '../../../domain/entities/team_entities/get_team_members_entity.dart';

class GetTeamMembersModel extends GetTeamMembersEntity {
  const GetTeamMembersModel(
      {required status, required pages, required data, required message})
      : super(status: status, pages: pages, data: data, message: message);

  factory GetTeamMembersModel.fromJson(Map<String, dynamic> json) {
    return GetTeamMembersModel(
      status: json["status"] ?? "",
      pages: json['pages'] ?? 0,
      data: List<GetTeamMembersDataModel>.from(
        json['data'].map((data) => GetTeamMembersDataModel.fromJson(data)),
      ),
      message: json['message'] ?? "",
    );
  }
}

class GetTeamMembersDataModel extends GetTeamMembersData {
  const GetTeamMembersDataModel(
      {required bio,
      required major,
      required universityIdNumber,
      required junior,
      required studentID,
      required teamID,
      required studentName,
      required isLeader})
      : super(
            teamID: teamID,
            studentID: studentID,
            major: major,
            universityIdNumber: universityIdNumber,
            bio: bio,
            junior: junior,
            name: studentName);

  factory GetTeamMembersDataModel.fromJson(Map<String, dynamic> json) {
    return GetTeamMembersDataModel(
      major: json['major'],
      studentName: json['name'],
      isLeader: json['is_leader'],
      studentID: json['id'],
      teamID: json['has_team'],
      universityIdNumber: json['University_id_number'],
      junior: json['junior'],
      bio: json['bio'] ?? "",
    );
  }
}
