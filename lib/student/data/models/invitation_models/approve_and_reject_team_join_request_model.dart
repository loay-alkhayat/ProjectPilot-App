import '../../../domain/entities/invitation_entites/approve_and_reject_team_join_request_entity.dart';

class AproveAndRejectTeamJoinRequestModel
    extends ApproveAndRejectTeamJoinRequestEntity {
  const AproveAndRejectTeamJoinRequestModel({
    required super.status,
    required super.message,
    required super.pages,
  });

  factory AproveAndRejectTeamJoinRequestModel.fromJson(
      Map<String, dynamic> json) {
    return AproveAndRejectTeamJoinRequestModel(
      status: json["status"] ?? "",
      message: json["message"] ?? "",
      pages: json['pages'],
    );
  }
}
