class SendJoinRequestParameters {
  final int reciverID;

  SendJoinRequestParameters({required this.reciverID});

  Map<String, dynamic> toJson() => {
        'receiver_id': reciverID,
      };
}
