class SendInviteToSuperVisorParameters {
  final int supevisorID;

  SendInviteToSuperVisorParameters({required this.supevisorID});

  Map<String, dynamic> toJson() => {
        'supervisor_id': supevisorID,
      };
}
