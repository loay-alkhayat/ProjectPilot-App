import 'package:projectpilot/student/domain/entities/student_entities/logout_entity.dart';

class LogoutModel extends LogoutEntity {
  const LogoutModel({required status, required message})
      : super(message: message, status: status);

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      status: json["status"],
      message: json["message"],
    );
  }
}
