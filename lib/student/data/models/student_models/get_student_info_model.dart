import '../../../domain/entities/student_entities/get_student_profile_by_token_entity.dart';

class GetStudentInfoModel extends GetStudentInfoEntity {
  const GetStudentInfoModel({
    required status,
    required pages,
    required data,
    required message,
  }) : super(
          message: message,
          status: status,
          pages: pages,
          data: data,
        );

  factory GetStudentInfoModel.fromJson(Map<String, dynamic> json) {
    return GetStudentInfoModel(
        status: json["status"],
        message: json["message"] ?? "",
        pages: json['pages'] ?? 0,
        data: GetStudentModel.fromjson(json['data']));
  }
}

class GetStudentModel extends GetStudentInfo {
  const GetStudentModel(
      {required super.userType,
      required super.name,
      required super.universityIdNumber,
      required super.bio,
      required super.isLeader,
      required super.teamID,
      required super.major,
      required super.junior,
      required super.studentID});

  factory GetStudentModel.fromjson(Map<String, dynamic> json) {
    return GetStudentModel(
        studentID: json['id'],
        teamID: json['has_team'],
        isLeader: json['is_leader'],
        userType: json['user_type'],
        name: json['name'] ?? "",
        universityIdNumber: json['University_id_number'],
        bio: json['bio'] ?? "",
        major: json['major'] ?? "",
        junior: json['junior']);
  }
}
