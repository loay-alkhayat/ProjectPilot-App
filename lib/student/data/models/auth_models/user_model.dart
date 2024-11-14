import '../../../domain/entities/student_entities/login_entity.dart';

class StudentModel extends StudentEntity {
  StudentModel(
      {required status, required message, required pages, required data})
      : super(message: message, status: status, data: data, pages: pages);

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        status: json["status"],
        message: json["message"],
        pages: json['pages'],
        data: StudentDataModel.fromJson(json['data']));
  }
}

class StudentDataModel extends StudentData {
  StudentDataModel({required super.user, required super.barrertoken});

  factory StudentDataModel.fromJson(Map<String, dynamic> json) {
    return StudentDataModel(
      barrertoken: json['access_token'],
      user: StudentInfo.fromjson(json['user']),
    );
  }
}

class StudentInfo extends Student {
  StudentInfo(
      {required userType,
      required name,
      required universityIdNumber,
      required bio,
      required major,
      required junior,
      required isLeader,
      required teamID,
      required userID})
      : super(
            universityIdNumber: universityIdNumber,
            major: major,
            userType: userType,
            name: name,
            junior: junior,
            bio: bio,
            isLeader: isLeader,
            teamID: teamID,
            userID: userID);

  factory StudentInfo.fromjson(Map<String, dynamic> json) {
    return StudentInfo(
      userType: json['user_type'],
      name: json['name'] ?? "",
      universityIdNumber: json['University_id_number'],
      bio: json['bio'] ?? " ",
      major: json['major'],
      junior: json['junior'],
      teamID: json['has_team'],
      isLeader: json['is_leader'],
      userID: json['id'],
    );
  }
}
