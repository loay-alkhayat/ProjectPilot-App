import 'package:equatable/equatable.dart';

class SendInviteToEngineerEntity extends Equatable {
  final String status;
  final int pages;
  final String message;
  final SendInviteToEngineerData data;

  const SendInviteToEngineerEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class SendInviteToEngineerData extends Equatable {
  final int senderId;
  final int reciverId;
  final int id;

  const SendInviteToEngineerData(
      {required this.senderId, required this.id, required this.reciverId});

  @override
  List<Object?> get props => [senderId, id, reciverId];
}
