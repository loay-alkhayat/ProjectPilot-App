import '../../../domain/entities/student_entities/get_student_by_id_entity.dart';

class GetStudentByIdModel extends GetStudentByIdEntity {
  const GetStudentByIdModel({
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

  factory GetStudentByIdModel.fromJson(Map<String, dynamic> json) {
    return GetStudentByIdModel(
        status: json["status"],
        message: json["message"] ?? "",
        pages: json['pages'] ?? 0,
        data: GetStudentByIdInfo.fromjson(json['data']));
  }
}

class GetStudentByIdInfo extends GetStudentByIdData {
  GetStudentByIdInfo(
      {required userType,
      required name,
      required universityIdNumber,
      required bio,
      required major,
      required junior,
      required hasTeam,
      required isLeader,
      required studentID})
      : super(
            isLeader: isLeader,
            teamID: hasTeam,
            bio: bio,
            junior: junior,
            name: name,
            userType: userType,
            major: major,
            universityIdNumber: universityIdNumber,
            studentID: studentID);

  factory GetStudentByIdInfo.fromjson(Map<String, dynamic> json) {
    return GetStudentByIdInfo(
        studentID: json['id'],
        hasTeam: json['has_team'],
        isLeader: json['is_leader'],
        userType: json['user_type'],
        name: json['name'] ?? "",
        universityIdNumber: json['University_id_number'],
        bio: json['bio'] ?? "",
        major: json['major'],
        junior: json['junior']);
  }
}
