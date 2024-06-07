import 'package:projectpilot/student/domain/entities/supervisors_entities/get_supervisor_entity.dart';

class SupervisorModel extends SupervisorEntity {
  SupervisorModel({
    required status,
    required pages,
    required data,
  }) : super(
          status: status,
          pages: pages,
          data: data,
        );

  factory SupervisorModel.fromJson(Map<String, dynamic> json) {
    return SupervisorModel(
      status: json["status"],
      pages: json['pages'],
      data: SupervisorDataModel.fromJson(json['data']),
    );
  }
}

class SupervisorDataModel extends SupervisortData {
  SupervisorDataModel({required supervisor}) : super(supervisor: supervisor);

  factory SupervisorDataModel.fromJson(Map<String, dynamic> json) {
    return SupervisorDataModel(
      supervisor: List<SupervisorInfo>.from(
        json['Supervisor'].map((data) => SupervisorInfo.fromJson(data)),
      ),
    );
  }
}

class SupervisorInfo extends Supervisor {
  SupervisorInfo({
    required userType,
    required name,
    required id,
  }) : super(userType: userType, name: name, id: id);

  factory SupervisorInfo.fromJson(Map<String, dynamic> json) {
    return SupervisorInfo(
      userType: json['user_type'], // Corrected key
      name: json['name'], id: json['id'],
    );
  }
}
