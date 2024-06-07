import 'package:projectpilot/student/domain/entities/student_entities/get_all_students_entity.dart';

class GetStudentsModel extends GetStudentsEntity {
  const GetStudentsModel({
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

  factory GetStudentsModel.fromJson(Map<String, dynamic> json) {
    return GetStudentsModel(
        status: json["status"],
        message: json["message"] ?? "",
        pages: json['pages'] ?? 0,
        data: GetStudentsDataModel.fromJson(json['data']));
  }
}

class GetStudentsDataModel extends GetStudentsData {
  const GetStudentsDataModel({required super.student});

  factory GetStudentsDataModel.fromJson(Map<String, dynamic> json) {
    return GetStudentsDataModel(
      student: List<GetStudentsInfo>.from(
        json['user'].map((data) => GetStudentsInfo.fromjson(data)),
      ),
    );
  }
}

class GetStudentsInfo extends GetStudents {
  GetStudentsInfo(
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

  factory GetStudentsInfo.fromjson(Map<String, dynamic> json) {
    return GetStudentsInfo(
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
