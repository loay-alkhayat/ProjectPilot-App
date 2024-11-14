import 'package:equatable/equatable.dart';

class SendInviteToEngineerEntity extends Equatable {
  final String status;
  final String pages;
  final String message;

  const SendInviteToEngineerEntity(
      {required this.status, required this.message, required this.pages});

  @override
  List<Object?> get props => [status, pages, message];
}
