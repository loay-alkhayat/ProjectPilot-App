import '../../../domain/entities/invitation_entites/send_join_team_request_entity.dart';

class SendJoinRequestModel extends SendJoinRequestEntity {
  const SendJoinRequestModel(
      {required super.status,
      required super.message,
      required super.pages,
      required super.data});

  factory SendJoinRequestModel.fromJson(Map<String, dynamic> json) {
    return SendJoinRequestModel(
        status: json["status"],
        message: json["message"],
        pages: json['pages'] ?? 0,
        data: SendJoinRequestDataModel.fromJson(json['data']));
  }
}

class SendJoinRequestDataModel extends SendJoinRequestData {
  const SendJoinRequestDataModel(
      {required super.senderId, required super.id, required super.reciverId});

  factory SendJoinRequestDataModel.fromJson(Map<String, dynamic> json) {
    return SendJoinRequestDataModel(
      id: json['id'],
      reciverId: json['receiver_id'],
      senderId: json['sender_id'],
    );
  }
}
