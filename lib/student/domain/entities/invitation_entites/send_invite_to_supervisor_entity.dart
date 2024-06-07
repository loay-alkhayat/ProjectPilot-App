import 'package:equatable/equatable.dart';

class SendInviteToSuperVisorEntity extends Equatable {
  final String status;
  final int pages;
  final String message;
  final SendInviteToSuperVisorData data;

  const SendInviteToSuperVisorEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class SendInviteToSuperVisorData extends Equatable {
  final int senderId;
  final int reciverId;
  final int id;

  const SendInviteToSuperVisorData(
      {required this.senderId, required this.id, required this.reciverId});

  @override
  List<Object?> get props => [senderId, id, reciverId];
}
