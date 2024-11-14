import '../../../domain/entities/invitation_entites/send_invite_to_supervisor_entity.dart';

class SendInviteToSupervisorModel extends SendInviteToSuperVisorEntity {
  const SendInviteToSupervisorModel({
    required super.status,
    required super.message,
    required super.pages,
  });

  factory SendInviteToSupervisorModel.fromJson(Map<String, dynamic> json) {
    return SendInviteToSupervisorModel(
      status: json["status"] ?? "",
      message: json["message"] ?? "",
      pages: json['pages'] ?? 0,
    );
  }
}
