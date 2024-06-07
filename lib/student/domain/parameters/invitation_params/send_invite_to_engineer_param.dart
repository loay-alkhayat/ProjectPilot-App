class SendInviteToEngineerParameters {
  final int engineerID;

  SendInviteToEngineerParameters({required this.engineerID});

  Map<String, dynamic> toJson() => {
        'engineer_id': engineerID,
      };
}
