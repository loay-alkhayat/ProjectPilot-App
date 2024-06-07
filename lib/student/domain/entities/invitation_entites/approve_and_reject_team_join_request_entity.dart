import 'package:equatable/equatable.dart';

class ApproveAndRejectTeamJoinRequestEntity extends Equatable {
  final String status;
  final String pages;
  final String message;

  const ApproveAndRejectTeamJoinRequestEntity(
      {required this.status, required this.message, required this.pages});

  @override
  List<Object?> get props => [status, pages, message];
}
