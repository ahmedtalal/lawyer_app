class MessageParameter {
  final int? chatId;
  final int? recieverId;
  final String? userName;
  final String message;

  MessageParameter({
    this.userName,
    this.chatId,
    this.recieverId,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
    "receiver_id" : recieverId,
    "content": message,
  };
}