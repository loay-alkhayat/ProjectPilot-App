import '../../../domain/entities/invitation_entites/get_student_join_request_entity.dart';

class GetStudentJoinRequestModel extends GetStudentJoinRequestEntity {
  const GetStudentJoinRequestModel(
      {required super.status,
      required super.message,
      required super.data,
      required super.pages});

  factory GetStudentJoinRequestModel.fromJson(Map<String, dynamic> json) {
    return GetStudentJoinRequestModel(
      status: json["status"],
      message: json["message"] ?? "",
      pages: json['pages'] ?? 0,
      data: List<GetStudentJoinRequestDataModel>.from(
        json['data']
            .map((data) => GetStudentJoinRequestDataModel.fromJson(data)),
      ),
    );
  }
}

class GetStudentJoinRequestDataModel extends GetStudentJoinRequestData {
  const GetStudentJoinRequestDataModel(
      {required super.requestID, required super.teamData});

  factory GetStudentJoinRequestDataModel.fromJson(Map<String, dynamic> json) {
    return GetStudentJoinRequestDataModel(
      requestID: json['id'],
      teamData: GetTeamDataOfStudentJoinRequestModel.fromjson(json['team']),
    );
  }
}

class GetTeamDataOfStudentJoinRequestModel
    extends GetTeamDataOfStudentJoinRequest {
  const GetTeamDataOfStudentJoinRequestModel(
      {required super.teamID,
      required super.teamLeaderInfo,
      required super.teamName});

  factory GetTeamDataOfStudentJoinRequestModel.fromjson(
      Map<String, dynamic> json) {
    return GetTeamDataOfStudentJoinRequestModel(
      teamID: json['id'],
      teamName: json['name'],
      teamLeaderInfo:
          GetTeamLeaderDataOfStudentJoinRequestModel.fromjson(json['leader']),
    );
  }
}

class GetTeamLeaderDataOfStudentJoinRequestModel
    extends GetTeamLeaderDataOfStudentJoinRequest {
  const GetTeamLeaderDataOfStudentJoinRequestModel({
    required super.leaderMajor,
    required super.leaderName,
  });

  factory GetTeamLeaderDataOfStudentJoinRequestModel.fromjson(
      Map<String, dynamic> json) {
    return GetTeamLeaderDataOfStudentJoinRequestModel(
      leaderMajor: json['major'],
      leaderName: json['name'],
    );
  }
}
