abstract class IChatInterface {
  Future<dynamic> getChats(var model);
  Future<dynamic> sendMessage(var momdel);
  Future<dynamic> sendMessageToAdmin(var model);
  Future<dynamic> getChatMessages(var model);
}
