import 'package:projectpilot/student/domain/entities/supervisors_entities/get_engineer_entity.dart';

class EngineerModel extends EngineerEntity {
  EngineerModel({required status, required pages, required data})
      : super(
          status: status,
          pages: pages,
          data: data,
        );

  factory EngineerModel.fromJson(Map<String, dynamic> json) {
    return EngineerModel(
        status: json["status"],
        pages: json['pages'],
        data: EngineerDataModel.fromJson(json['data']));
  }
}

class EngineerDataModel extends EngineerData {
  EngineerDataModel({required engineer}) : super(engineer: engineer);

  factory EngineerDataModel.fromJson(Map<String, dynamic> json) {
    return EngineerDataModel(
        engineer: List<engineerInfo>.from(
      json['Engineer'].map((data) => engineerInfo.fromjson(data)),
    ));
  }
}

class engineerInfo extends Engineer {
  engineerInfo({
    required userType,
    required name,
    required id,
  }) : super(userType: userType, name: name, id: id);

  factory engineerInfo.fromjson(Map<String, dynamic> json) {
    return engineerInfo(
      userType: json['user_type'],
      name: json['name'],
      id: json['id'],
    );
  }
}
