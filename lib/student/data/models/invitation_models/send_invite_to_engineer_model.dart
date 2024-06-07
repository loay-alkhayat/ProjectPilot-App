import '../../../domain/entities/invitation_entites/send_invite_to_engineer_entity.dart';

class SendInviteToEngineerModel extends SendInviteToEngineerEntity {
  const SendInviteToEngineerModel(
      {required super.status,
      required super.message,
      required super.pages,
      required super.data});

  factory SendInviteToEngineerModel.fromJson(Map<String, dynamic> json) {
    return SendInviteToEngineerModel(
        status: json["status"] ?? "",
        message: json["message"] ?? "",
        pages: json['pages'] ?? 0,
        data: json['data'] != null
            ? SendInviteToEngineerDataModel.fromJson(json['data'])
            : null!);
  }
}

class SendInviteToEngineerDataModel extends SendInviteToEngineerData {
  const SendInviteToEngineerDataModel(
      {required super.senderId, required super.id, required super.reciverId});

  factory SendInviteToEngineerDataModel.fromJson(Map<String, dynamic> json) {
    return SendInviteToEngineerDataModel(
      id: json['id'],
      reciverId: json['receiver_id'],
      senderId: json['sender_id'],
    );
  }
}
