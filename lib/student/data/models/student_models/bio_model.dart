import 'package:projectpilot/student/domain/entities/student_entities/add_bio_entitiy.dart';

class BioModel extends BioEntity {
  BioModel(
      {required super.status,
      required super.message,
      required super.pages,
      required super.data});

  factory BioModel.fromJson(Map<String, dynamic> json) {
    return BioModel(
        status: json["status"],
        message: json["message"] ?? "",
        pages: json['pages'],
        data: BioDataModel.fromJson(json['data']));
  }
}

class BioDataModel extends BiotData {
  BioDataModel({required super.user});

  factory BioDataModel.fromJson(Map<String, dynamic> json) {
    return BioDataModel(
      user: BioInfo.fromjson(json['user']),
    );
  }
}

class BioInfo extends Bio {
  BioInfo(
      {required super.userType,
      required super.name,
      required super.universityIdNumber,
      required super.bio,
      required super.major,
      required super.junior});

  factory BioInfo.fromjson(Map<String, dynamic> json) {
    return BioInfo(
        userType: json['user_type'],
        name: json['name'],
        universityIdNumber: json['University_id_number'],
        bio: json['bio'],
        major: json['major'],
        junior: json['junior']);
  }
}
