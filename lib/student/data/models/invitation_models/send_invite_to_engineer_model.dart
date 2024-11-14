import '../../../domain/entities/invitation_entites/send_invite_to_engineer_entity.dart';

class SendInviteToEngineerModel extends SendInviteToEngineerEntity {
  const SendInviteToEngineerModel({
    required super.status,
    required super.message,
    required super.pages,
  });

  factory SendInviteToEngineerModel.fromJson(Map<String, dynamic> json) {
    return SendInviteToEngineerModel(
      status: json["status"] ?? "",
      message: json["message"] ?? "",
      pages: json['pages'] ?? 0,
    );
  }
}
