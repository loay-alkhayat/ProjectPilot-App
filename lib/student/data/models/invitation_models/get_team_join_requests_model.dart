import 'package:projectpilot/student/domain/entities/invitation_entites/get_team_join_requests.dart';

class GetTeamJoinRequestModel extends GetTeamJoinRequestEntity {
  const GetTeamJoinRequestModel(
      {required super.status,
      required super.message,
      required super.data,
      required super.pages});

  factory GetTeamJoinRequestModel.fromJson(Map<String, dynamic> json) {
    return GetTeamJoinRequestModel(
      status: json["status"],
      message: json["message"] ?? "",
      pages: json['pages'] ?? 0,
      data: List<GetTeamJoinRequestDataModel>.from(
        json['data'].map((data) => GetTeamJoinRequestDataModel.fromJson(data)),
      ),
    );
  }
}

class GetTeamJoinRequestDataModel extends GetTeamJoinRequestData {
  const GetTeamJoinRequestDataModel(
      {required super.requestID, required super.studentData});

  factory GetTeamJoinRequestDataModel.fromJson(Map<String, dynamic> json) {
    return GetTeamJoinRequestDataModel(
      requestID: json['id'],
      studentData: GetTeamJoinRequestStudentModel.fromjson(json['student']),
    );
  }
}

class GetTeamJoinRequestStudentModel extends GetTeamJoinRequestStudentData {
  const GetTeamJoinRequestStudentModel(
      {required super.studentId,
      required super.uniNumber,
      required super.studentName,
      required super.bio,
      required super.major});

  factory GetTeamJoinRequestStudentModel.fromjson(Map<String, dynamic> json) {
    return GetTeamJoinRequestStudentModel(
        studentName: json['name'],
        studentId: json['id'],
        uniNumber: json['University_id_number'],
        bio: json['bio'] ?? "",
        major: json['major']);
  }
}
