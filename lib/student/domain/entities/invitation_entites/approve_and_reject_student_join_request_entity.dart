import 'package:equatable/equatable.dart';

class ApproveAndRejectStudentJoinRequestEntity extends Equatable {
  final int requestID;

  const ApproveAndRejectStudentJoinRequestEntity({required this.requestID});

  @override
  List<Object?> get props => [requestID];
}
