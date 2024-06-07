import 'package:projectpilot/student/domain/entities/team_entities/get_uni_proposals.dart';

class GetProposalsModel extends GetProposalsEntity {
  const GetProposalsModel({
    required status,
    required pages,
    required data,
    required message,
  }) : super(
          message: message,
          status: status,
          pages: pages,
          data: data,
        );

  factory GetProposalsModel.fromJson(Map<String, dynamic> json) {
    return GetProposalsModel(
        status: json["status"],
        message: json["message"] ?? "",
        pages: json['pages'] ?? 0,
        data: GetProposalsDataModel.fromJson(json['data']));
  }
}

class GetProposalsDataModel extends GetProposalsData {
  const GetProposalsDataModel({required super.proposals});

  factory GetProposalsDataModel.fromJson(Map<String, dynamic> json) {
    return GetProposalsDataModel(
      proposals: List<GetProposalsInfo>.from(
        json['Univercity_Proposal']
            .map((data) => GetProposalsInfo.fromjson(data)),
      ),
    );
  }
}

class GetProposalsInfo extends GetProposals {
  GetProposalsInfo({
    required super.filePath,
    required super.name,
    required super.description,
  });

  factory GetProposalsInfo.fromjson(Map<String, dynamic> json) {
    return GetProposalsInfo(
      description: json['description'],
      filePath: json['file'],
      name: json['name'] ?? "",
    );
  }
}
