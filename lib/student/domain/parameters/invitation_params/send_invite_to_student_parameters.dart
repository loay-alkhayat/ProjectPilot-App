class SendInviteParameters {
  final int reciverID;

  SendInviteParameters({required this.reciverID});

  Map<String, dynamic> toJson() => {
        'receiver_id': reciverID,
      };
}
