import 'package:equatable/equatable.dart';

class SendJoinRequestEntity extends Equatable {
  final String status;
  final int pages;
  final String message;
  final SendJoinRequestData data;

  const SendJoinRequestEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class SendJoinRequestData extends Equatable {
  final int senderId;
  final int reciverId;
  final int id;

  const SendJoinRequestData(
      {required this.senderId, required this.id, required this.reciverId});

  @override
  List<Object?> get props => [senderId, id, reciverId];
}
