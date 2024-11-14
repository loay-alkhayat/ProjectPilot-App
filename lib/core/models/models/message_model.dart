class MessageModel {
  String? dateTime;
  String? reciverId;
  String? senderId;
  String? senderName;
  String? text;
  MessageModel(
      this.dateTime, this.reciverId, this.senderId, this.senderName, this.text);

  MessageModel.fromJson(Map<String, dynamic> json) {
    dateTime = json['dateTime'];
    reciverId = json['reciverId'];
    senderId = json['senderId'];
    text = json['text'];
    senderName = json['senderName'];
  }

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime,
      'reciverId': reciverId,
      'senderId': senderId,
      'text': text,
      'senderName': senderName,
    };
  }
}
