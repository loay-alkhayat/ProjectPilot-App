class RejectTeamJoinRequestParameters {
  final int requestID;

  RejectTeamJoinRequestParameters({required this.requestID});

  Map<String, dynamic> toJson() => {
        'request_id': requestID,
      };
}
