class MessageParameter {
  final int? chatId;
  final int? recieverId;
  final String? userName;
  final String message;
  final bool isAdmin;

  MessageParameter({
    this.userName,
    this.chatId,
    this.recieverId,
    required this.message,
    required this.isAdmin,

  });

  Map<String, dynamic> toJson() => {
    "receiver_id" : recieverId,
    "content": message,
  };
}