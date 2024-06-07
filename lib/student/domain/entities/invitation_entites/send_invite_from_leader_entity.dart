import 'package:equatable/equatable.dart';

class SendInviteEntity extends Equatable {
  final String status;
  final int pages;
  final String message;
  final SendInviteData data;

  const SendInviteEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class SendInviteData extends Equatable {
  final int senderId;
  final int reciverId;
  final int id;

  const SendInviteData(
      {required this.senderId, required this.id, required this.reciverId});

  @override
  List<Object?> get props => [senderId, id, reciverId];
}
