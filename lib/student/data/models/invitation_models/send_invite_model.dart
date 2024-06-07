import 'package:projectpilot/student/domain/entities/invitation_entites/send_invite_from_leader_entity.dart';

class SendInviteModel extends SendInviteEntity {
  SendInviteModel(
      {required super.status,
      required super.message,
      required super.pages,
      required super.data});

  factory SendInviteModel.fromJson(Map<String, dynamic> json) {
    return SendInviteModel(
        status: json["status"] ?? "",
        message: json["message"] ?? "",
        pages: json['pages'] ?? 0,
        data: json['data'] != null
            ? SendInviteDataModel.fromJson(json['data'])
            : null!);
  }
}

class SendInviteDataModel extends SendInviteData {
  const SendInviteDataModel(
      {required super.senderId, required super.id, required super.reciverId});

  factory SendInviteDataModel.fromJson(Map<String, dynamic> json) {
    return SendInviteDataModel(
      id: json['id'],
      reciverId: json['receiver_id'],
      senderId: json['sender_id'],
    );
  }
}
