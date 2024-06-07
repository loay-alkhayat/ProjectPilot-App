import '../../../domain/entities/invitation_entites/approve_and_reject_student_join_request_entity.dart';

class AproveAndRejectStudentJoinRequestModel
    extends ApproveAndRejectStudentJoinRequestEntity {
  const AproveAndRejectStudentJoinRequestModel({required super.requestID});

  factory AproveAndRejectStudentJoinRequestModel.fromJson(
      Map<String, dynamic> json) {
    return AproveAndRejectStudentJoinRequestModel(
      requestID: json['id'],
    );
  }
}
