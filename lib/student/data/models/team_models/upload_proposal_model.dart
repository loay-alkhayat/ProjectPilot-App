import '../../../domain/entities/team_entities/upload_proposal_entity.dart';

class UploadProposalModel extends UploadProposalEntity {
  const UploadProposalModel({required status, required pages, required message})
      : super(status: status, pages: pages, message: message);

  factory UploadProposalModel.fromJson(Map<String, dynamic> json) {
    return UploadProposalModel(
      status: json["status"] ?? "",
      pages: json['pages'] ?? 0,
      message: json['message'] ?? "",
    );
  }
}
