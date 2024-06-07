class ApproveStudentJoinRequestParameters {
  final int requestID;

  ApproveStudentJoinRequestParameters({required this.requestID});

  Map<String, dynamic> toJson() => {
        'request_id': requestID,
      };
}
