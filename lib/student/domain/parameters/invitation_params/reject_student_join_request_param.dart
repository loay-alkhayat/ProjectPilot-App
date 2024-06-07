class RejectStudentJoinRequestParameters {
  final int requestID;

  RejectStudentJoinRequestParameters({required this.requestID});

  Map<String, dynamic> toJson() => {
        'request_id': requestID,
      };
}
