import '../../../domain/entities/invitation_entites/send_invite_to_supervisor_entity.dart';

class SendInviteToSupervisorModel extends SendInviteToSuperVisorEntity {
  const SendInviteToSupervisorModel(
      {required super.status,
      required super.message,
      required super.pages,
      required super.data});

  factory SendInviteToSupervisorModel.fromJson(Map<String, dynamic> json) {
    return SendInviteToSupervisorModel(
        status: json["status"] ?? "",
        message: json["message"] ?? "",
        pages: json['pages'] ?? 0,
        data: json['data'] != null
            ? SendInviteToSuperVisorDataModel.fromJson(json['data'])
            : null!);
  }
}

class SendInviteToSuperVisorDataModel extends SendInviteToSuperVisorData {
  const SendInviteToSuperVisorDataModel(
      {required super.senderId, required super.id, required super.reciverId});

  factory SendInviteToSuperVisorDataModel.fromJson(Map<String, dynamic> json) {
    return SendInviteToSuperVisorDataModel(
      id: json['id'],
      reciverId: json['receiver_id'],
      senderId: json['sender_id'],
    );
  }
}
