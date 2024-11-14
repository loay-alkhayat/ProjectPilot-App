import 'package:equatable/equatable.dart';

class SendInviteToSuperVisorEntity extends Equatable {
  final String status;
  final int pages;
  final String message;

  const SendInviteToSuperVisorEntity(
      {required this.status, required this.message, required this.pages});

  @override
  List<Object?> get props => [status, pages, message];
}
