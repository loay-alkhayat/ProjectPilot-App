class ApproveTeamJoinRequestParameters {
  final int requestID;

  ApproveTeamJoinRequestParameters({required this.requestID});

  Map<String, dynamic> toJson() => {
        'request_id': requestID,
      };
}
